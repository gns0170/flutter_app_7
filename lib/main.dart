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
import 'package:flutter_provider/flutter_provider.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart' as p;
import './screens/home.dart';
import './values/colors.dart' as custom_colors;
import 'package:google_mobile_ads/google_mobile_ads.dart';

import './test.dart';

//inapp Test
import './logic/dash_purchases.dart';
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

  runApp(p.MultiProvider(providers: [
    p.ChangeNotifierProvider<DashPurchases>(
      create: (context) => DashPurchases(
        context.read<DashCounter>(),
      ),
      lazy: false,
    ),
  ], child: const MyApp()));
}

Record R = Record();

//test inapp
// Gives the option to override in tests.
class IAPConnection {
  static InAppPurchase? _instance;
  static set instance(InAppPurchase value) {
    _instance = value;
  }

  static InAppPurchase get instance {
    _instance ??= InAppPurchase.instance;
    return _instance!;
  }
}
//inapp end

//루트 관리
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    //inapp

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

    //in app

    //in app end

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
          ),
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
                initialRoute: "/test",
                routes: {
                  '/home': (context) => const Home(),
                  '/question': (context) => const Question(),
                  '/result': (context) => const Result(),
                  '/achievement': (context) => const Achievement(),
                  '/test': (context) => const InApp(),
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

//in app class
