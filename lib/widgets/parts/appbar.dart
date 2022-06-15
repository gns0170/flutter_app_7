import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/iap/logic/firebase_notifier.dart';
import 'package:flutter_application_7/iap/model/purchasable_product.dart';
import 'package:flutter_application_7/iap/model/firebase_state.dart';

import 'package:flutter_application_7/iap/model/store_state.dart';
import 'package:flutter_application_7/iap/repo/iap_repo.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';

import 'package:flutter_application_7/widgets/parts/achievement_popup/achievement_show.dart';

import 'package:provider/provider.dart';

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

    // if (!firebaseNotifier.loggedIn) {
    //   return const LoginPage();
    // }

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
        if (drawerSwitch.valueAchievement == true) {
          drawerSwitch.changeAchievement();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Achievement()));
        }
        if (appBarSwitch.value == true) {
          appBarSwitch.changeShownAchieve();
          shownAchieve(context, null, null, null);
        }
        if (appBarSwitch.valueAdPopup == true) {
          appBarSwitch.changeValueAdPopup();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: SizedBox(
                  height: 400,
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("광고 없애기", style: TextStyle(fontSize: 18)),
                        ElevatedButton(
                            onPressed: () {
                              firebaseNotifier.login();
                            },
                            child: const Text('Login')),
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
                        ,
                        const PastPurchasesWidget()
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

///purchase pages
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

    print(product.id);
    print(product.status);
    return true
        ? InkWell(
            onTap: onPressed,
            child: ListTile(
              title: Text(title),
              subtitle: Text(product.description),
              trailing: Text(_trailing()),
            ))
        : const SizedBox.shrink();
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

class PastPurchasesWidget extends StatelessWidget {
  const PastPurchasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var purchases = context.watch<IAPRepo>().purchases;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: purchases.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(purchases[index].title),
        subtitle: Text(purchases[index].status.toString()),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
