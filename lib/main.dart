
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/data/record.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';
import 'package:flutter_application_7/screens/questions.dart';
import 'package:flutter_application_7/screens/result/result.dart';
import 'package:flutter_application_7/screens/statistics.dart';
import 'package:flutter_application_7/widgets/parts/appbar.dart';
import 'package:flutter_application_7/widgets/parts/drawer.dart';
import './screens/home.dart';
import './values/colors.dart' as custom_colors;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_provider/flutter_provider.dart';

import 'package:in_app_purchase/in_app_purchase.dart';

//import for InAppPurchaseAndroidPlatformAddition
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
//import for BillingResponse
import 'package:in_app_purchase_android/billing_client_wrappers.dart';



//inapp Test
void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
  purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.status == PurchaseStatus.pending) {
      _showPendingUI();
    } else {
      if (purchaseDetails.status == PurchaseStatus.error) {
        _handleError(purchaseDetails.error!);
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                 purchaseDetails.status == PurchaseStatus.restored) {
        bool valid = await _verifyPurchase(purchaseDetails);
        if (valid) {
          _deliverProduct(purchaseDetails);
        } else {
          _handleInvalidPurchase(purchaseDetails);
        }
      }
      if (purchaseDetails.pendingCompletePurchase) {
        await InAppPurchase.instance
            .completePurchase(purchaseDetails);
      }
    }
  });
}
final bool available = await InAppPurchase.instance.isAvailable();
if (!available) {
  // The store cannot be reached or accessed. Update the UI accordingly.
}

// Set literals require Dart 2.2. Alternatively, use
// `Set<String> _kIds = <String>['product1', 'product2'].toSet()`.
const Set<String> _kIds = <String>{'product1', 'product2'};
final ProductDetailsResponse response =
    await InAppPurchase.instance.queryProductDetails(_kIds);
if (response.notFoundIDs.isNotEmpty) {
  // Handle the error.
}
List<ProductDetails> products = response.productDetails;

await InAppPurchase.instance.restorePurchases();



final ProductDetails productDetails = ... // Saved earlier from queryProductDetails().
final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
if (_isConsumable(productDetails)) {
  InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
} else {
  InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
}
// From here the purchase flow will be handled by the underlying store.
// Updates will be delivered to the `InAppPurchase.instance.purchaseStream`.


final PurchaseDetails oldPurchaseDetails = ...;
PurchaseParam purchaseParam = GooglePlayPurchaseParam(
    productDetails: productDetails,
    changeSubscriptionParam: ChangeSubscriptionParam(
        oldPurchaseDetails: oldPurchaseDetails,
        prorationMode: ProrationMode.immediateWithTimeProration));
InAppPurchase.instance
    .buyNonConsumable(purchaseParam: purchaseParam);






if (Platform.isAndroid) {
  final InAppPurchaseAndroidPlatformAddition androidAddition =
    _inAppPurchase
      .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
  var priceChangeConfirmationResult =
      await androidAddition.launchPriceChangeConfirmationFlow(
    sku: 'purchaseId',
  );
  if (priceChangeConfirmationResult.responseCode == BillingResponse.ok){
    // TODO acknowledge price change
  }else{
    // TODO show error
  }
}

//inappTest







//Route Aware Test
abstract class RouteAware {
  /// Called when the top route has been popped off, and the current route
  /// shows up.
  void didPopNext() {}

  /// Called when the current route has been pushed.
  void didPush() {}

  /// Called when the current route has been popped off.
  void didPop() {}

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  void didPushNext() {}
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.unspecified,
      testDeviceIds: <String>[
        "d3b14dfe-7806-41c1-a8e4-f064ca23dbe9",
        "b707453f-ec54-4d0e-8f08-c3d236ce513f"
      ]));
  runApp(const MyApp());
}

Record R = Record();

//루트 관리
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  //test inapp
    StreamSubscription<List<PurchaseDetails>> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }



//inapp end















  @override
  void initState() {
    //inapp
    final Stream purchaseUpdated =
        InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });
    super.initState();
    //inapp


    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    // Load ads.
  }

  @override
  Widget build(BuildContext context) {
    R.loadRecord();

    return Providers(
        providers: [
          Provider<DrawerSwitch>.value(
            drawerSwitch,
            disposer: (v) => v.dispose(),
          ),
          Provider<AppBarSwitch>.value(
            appBarSwitch,
            disposer: (v) => v.dispose(),
          ),
          Provider<HomeSwitch>.value(
            homeSwitch,
            disposer: (v) => v.dispose(),
          )
        ],
        child: MaterialApp(
            title: 'A',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  color: custom_colors.primaryColor1,
                  actionsIconTheme: IconThemeData(
                    color: Colors.white,
                    size: 32,
                  )),
            ),
            home: Scaffold(
              appBar: const BaseAppBar(),
              drawer: const Drawer(child: BaseDrawer()),
              body: MaterialApp(
                navigatorObservers: [routeObserver],
                initialRoute: "/home",
                routes: {
                  '/home': (context) => const Home(),
                  '/question': (context) => const Question(),
                  '/result': (context) => const Result(),
                  '/achievement': (context) => const Achievement(),
                  '/test': (context) => const TestScreen(),
                  '/statistics': (context) => const Statistics(),
                },
              ),
            )));
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: const Text("123"),
      ),
    );
  }
}
