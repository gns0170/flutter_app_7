import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/main.dart';
import 'package:flutter_application_7/model/purchasable_product.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class DashPurchases extends ChangeNotifier {
  DashCounter counter;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final iapConnection = IAPConnection.instance;

  DashPurchases(this.counter) {
    final purchaseUpdated = iapConnection.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: _updateStreamOnDone,
      onError: _updateStreamOnError,
    );
    loadPurchases();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> buy(PurchasableProduct product) async {
    // omitted
  }

  void _onPurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
    // Handle purchases here
  }

  void _updateStreamOnDone() {
    _subscription.cancel();
  }

  void _updateStreamOnError(dynamic error) {
    //Handle error here
  }

  Future<void> loadPurchases() async {
    final available = await iapConnection.isAvailable();
    if (!available) {
      storeState = StoreState.notAvailable;
      notifyListeners();
      return;
    }
    const ids = <String>{
      storeKeyConsumable,
      storeKeySubscription,
      storeKeyUpgrade,
    };
    final response = await iapConnection.queryProductDetails(ids);
    for (var element in response.notFoundIDs) {
      debugPrint('Purchase $element not found');
    }
    products =
        response.productDetails.map((e) => PurchasableProduct(e)).toList();
    storeState = StoreState.available;
    notifyListeners();
  }
}
