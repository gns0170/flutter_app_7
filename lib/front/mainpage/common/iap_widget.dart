import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/model/firebase_state.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/model/purchasable_product.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/model/store_state.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/repo/iap_repo.dart';
import 'package:provider/provider.dart';

//iap 팝업
class PurchasePopUp extends StatelessWidget {
  const PurchasePopUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var firebaseNotifier = context.watch<FirebaseNotifier>();
    if (firebaseNotifier.state == FirebaseState.loading) {
      return const PurchasesLoading();
    } else if (firebaseNotifier.state == FirebaseState.notAvailable) {
      return const PurchasesNotAvailable();
    }
    var purchases = context.watch<DashPurchases>();
    var products = purchases.products;

    Widget storeWidget;
    switch (purchases.storeState) {
      case StoreState.loading:
        storeWidget = const PurchasesLoading();
        break;
      case StoreState.available:
        storeWidget = PurchaseList(products: products);
        break;
      case StoreState.notAvailable:
        storeWidget = const PurchasesNotAvailable();
        break;
    }
    return AlertDialog(
        content: SizedBox(
      height: 250,
      width: 100,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("광고 없애기", style: TextStyle(fontSize: 18)),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child:
                firebaseNotifier.isLoggingIn ? const LoginPage() : storeWidget)
      ]),
    ));
  }
}

class PurchasesLoading extends StatelessWidget {
  const PurchasesLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store is loading'));
  }
}

class PurchasesNotAvailable extends StatelessWidget {
  const PurchasesNotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store not available'));
  }
}

class PurchaseList extends StatelessWidget {
  const PurchaseList({Key? key, required List<PurchasableProduct> products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var purchases = context.watch<DashPurchases>();
    var products = purchases.products;

    return Column(
      children: products
          .map((product) => PurchaseWidget(
              product: product,
              onPressed: () {
                purchases.buy(product);
              }))
          .toList(),
    );
  }
}

class PurchaseWidget extends StatelessWidget {
  final PurchasableProduct product;
  final VoidCallback onPressed;

  const PurchaseWidget({
    super.key,
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var title = product.title;
    title =
        title.replaceAll("(com.testpotato.right_position (unreviewed))", "");
    if (product.status == ProductStatus.purchased) {
      title += ' (purchased)';
    }
    return InkWell(
        onTap: onPressed,
        child: ListTile(
          title: Text(
            title,
          ),
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var firebaseNotifier = context.watch<FirebaseNotifier>();

    if (firebaseNotifier.isLoggingIn) {
      return const Center(
        child: Text('Logging in...'),
      );
    }
    return Center(
        child: ElevatedButton(
      onPressed: () {
        firebaseNotifier.login();
      },
      child: const Text('Login'),
    ));
  }
}
