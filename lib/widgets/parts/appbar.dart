import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/iap/logic/firebase_notifier.dart';
import 'package:flutter_application_7/main.dart';
import 'package:flutter_application_7/iap/model/firebase_state.dart';
import 'package:flutter_application_7/iap/model/purchasable_product.dart';
import 'package:flutter_application_7/iap/model/store_state.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';

import 'package:flutter_application_7/widgets/parts/achievement_popup/achievement_show.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:provider/provider.dart' as fp;

class BaseAppBar extends StatefulWidget with PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  _BaseAppBarState createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  //inapp purchase

  @override
  Widget build(BuildContext context) {
    //inapp Purchase
    var firebaseNotifier = context.watch<FirebaseNotifier>();
    if (firebaseNotifier.state == FirebaseState.loading) {
      return _PurchasesLoading();
    } else if (firebaseNotifier.state == FirebaseState.notAvailable) {
      return _PurchasesNotAvailable();
    }

    if (!firebaseNotifier.loggedIn) {
      return const LoginPage();
    }

    var upgrades = context.watch<DashPurchases>();

    Widget storeWidget;
    switch (upgrades.storeState) {
      case StoreState.loading:
        storeWidget = _PurchasesLoading();
        break;
      case StoreState.available:
        storeWidget = _PurchaseList();
        break;
      case StoreState.notAvailable:
        storeWidget = _PurchasesNotAvailable();
        break;
    }

    //Drawer Page Change
    Future.delayed(Duration.zero, () {
      setState(() {
        if (Provider.of<DrawerSwitch>(context).valueAchievement == true) {
          drawerSwitch.changeAchievement();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Achievement()));
        }
        if (Provider.of<AppBarSwitch>(context).value == true) {
          appBarSwitch.changeShownAchieve();
          shownAchieve(context, null, null, null);
        }
        if (Provider.of<AppBarSwitch>(context).valueAdPopup == true) {
          appBarSwitch.changeValueAdPopup();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("광고 없애기", style: TextStyle(fontSize: 18)),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              homeSwitch.changeSwitchAd();
                            },
                            child: firebaseNotifier.isLoggingIn
                                ? const Center(child: Text('Logging in...'))
                                : storeWidget)
                        // const Text('￦500',
                        //     style: TextStyle(fontSize: 15)))
                      ]),
                ));
              });
        }
      });
    });
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            appBarSwitch.changeValueAdPopup();
          },
          splashRadius: 30,
          icon: const Icon(Icons.share),
        ),
        const SizedBox(
          width: 2,
        ),
        Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                splashRadius: 30,
                icon: const Icon(Icons.format_list_bulleted));
          },
        ),
        const SizedBox(
          width: 17,
        ),
      ],
    );
  }
}

class _PurchasesLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store is loading'));
  }
}

class _PurchasesNotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store not available'));
  }
}

class _PurchaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var purchases = context.watch<DashPurchases>();
    var products = purchases.products;
    return Column(
      children: products
          .map((product) => _PurchaseWidget(
              product: product,
              onPressed: () {
                purchases.buy(product);
              }))
          .toList(),
    );
  }
}

class _PurchaseWidget extends StatelessWidget {
  final PurchasableProduct product;
  final VoidCallback onPressed;

  const _PurchaseWidget({
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var title = product.title
        .replaceAll('(com.testpotato.right_position (unreviewed))', '');

    if (product.status == ProductStatus.purchased) {
      title += ' (purchased)';
    }
    return InkWell(
        onTap: onPressed,
        child: ListTile(
          title: Text(title),
          subtitle: Text(product.description),
          trailing: Text(_trailing()),
        ));
  }

  String _trailing() {
    switch (product.status) {
      case ProductStatus.purchasable:
        return product.price;
      case ProductStatus.purchased:
        return 'purchased';
      case ProductStatus.pending:
        return 'buying...';
    }
  }
}
