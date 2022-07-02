import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/functions/iap/model/purchasable_product.dart';
import 'package:flutter_application_7/back/functions/iap/repo/iap_repo.dart';
import 'package:provider/provider.dart';

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