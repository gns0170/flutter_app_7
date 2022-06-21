import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/data/record.dart';
import 'package:flutter_application_7/iap/logic/firebase_notifier.dart';
import 'package:flutter_application_7/iap/repo/iap_repo.dart';
import 'package:flutter_application_7/provider/switch.dart';

import 'package:flutter_application_7/screens/achievements/achievement.dart';
import 'package:flutter_application_7/screens/questions.dart';
import 'package:flutter_application_7/screens/result/result.dart';
import 'package:flutter_application_7/screens/statistics.dart';
import 'package:flutter_application_7/widgets/parts/appbar.dart';
import 'package:flutter_application_7/widgets/parts/drawer.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
import './screens/home.dart';
import './values/colors.dart' as custom_colors;
import 'package:google_mobile_ads/google_mobile_ads.dart';

//inapp Test
import './iap/logic/dash_purchases.dart';
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

Widget providerApp(Widget mainWidget) {
  return MultiProvider(providers: [
    ChangeNotifierProvider<FirebaseNotifier>(create: (_) => FirebaseNotifier()),
    ChangeNotifierProvider<IAPRepo>(
      create: (context) => IAPRepo(context.read<FirebaseNotifier>()),
    ),
    ChangeNotifierProvider<ProviderSwitches>(
        create: ((context) =>
            ProviderSwitches(context.read<FirebaseNotifier>()))),
    ChangeNotifierProvider<DashPurchases>(
      create: (context) => DashPurchases(
        context.read<ProviderSwitches>(),
        context.read<FirebaseNotifier>(),
        context.read<IAPRepo>(),
      ),
      lazy: false,
    ),
    Provider<DrawerSwitch>(create: (_) => drawerSwitch),
    Provider<AppBarSwitch>(create: (_) => appBarSwitch),
  ], child: mainWidget);
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
    super.initState();
    //inapp
    //inapp

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
      ),
    );
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
    var firebaseNotifier = context.watch<FirebaseNotifier>();

    if (!firebaseNotifier.loggedIn) {
      return const LoginPage();
    }

    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [Text('132')]));
  }
}

//in app class
// class InitBackend extends StatefulWidget {
//   const InitBackend({Key? key}) : super(key: key);
//   @override
//   _InitBackendState createState() => _InitBackendState();
// }

// class _InitBackendState extends State<InitBackend> {
//   @override
//   Widget build(BuildContext context) {
//     //IAP
//     var purchase = context.read<DashPurchases>();
//     //AD 확인
//     Future.delayed(Duration.zero, () => setState(() {}));
//     return const SizedBox(width: 0, height: 0);
//   }
// }
