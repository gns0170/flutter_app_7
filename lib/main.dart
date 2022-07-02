import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/back/data/record.dart';
import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';

import 'package:flutter_application_7/back/functions/iap/repo/iap_repo.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/provider/switch.dart';
import 'package:flutter_application_7/system_for_backend.dart';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_7/front/provider/values/colors.dart'
    as custom_colors;
import 'package:google_mobile_ads/google_mobile_ads.dart';

//inapp Test

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
  InAppPurchase;
  MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.unspecified,
      testDeviceIds: <String>[
        "d3b14dfe-7806-41c1-a8e4-f064ca23dbe9",
        "b707453f-ec54-4d0e-8f08-c3d236ce513f"
      ]));

  ///in app purchase
  runApp(providerApp(const MyApp()));
}

//Provider 모음, runApp 전에 최상위로 실행됨.
Widget providerApp(Widget mainWidget) {
  return MultiProvider(providers: [
    ChangeNotifierProvider<FirebaseNotifier>(create: (_) => FirebaseNotifier()),
    ChangeNotifierProvider<IAPRepo>(
      create: (context) => IAPRepo(context.read<FirebaseNotifier>()),
    ),
    ChangeNotifierProvider<ProviderUpgrade>(
        create: ((context) =>
            ProviderUpgrade(context.read<FirebaseNotifier>()))),
    ChangeNotifierProvider<DashPurchases>(
      create: (context) => DashPurchases(
        context.read<ProviderUpgrade>(),
        context.read<FirebaseNotifier>(),
        context.read<IAPRepo>(),
      ),
      lazy: false,
    ),
    ChangeNotifierProvider<ProviderPopup>(create: (_) => ProviderPopup()),
    ChangeNotifierProvider<ProviderNavigation>(
        create: (_) => ProviderNavigation()),
    ChangeNotifierProvider<ProviderCustomNavigation>(
        create: (_) => ProviderCustomNavigation())
  ], child: mainWidget);
}

Record R = Record();

//앱 루트
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // fix screen direction
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    // Load ads.
  }

  @override
  Widget build(BuildContext context) {
    //Provider 불러오기

    R.loadRecord();

    return MaterialApp(
        title: 'A',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: custom_colors.primaryColor1,
              actionsIconTheme: IconThemeData(
                color: Colors.white,
                size: 32,
              )),
        ),
        home: const SystemForBackEnd());
  }
}
