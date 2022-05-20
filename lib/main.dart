import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/record.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';
import 'package:flutter_application_7/screens/questions.dart';
import 'package:flutter_application_7/screens/result/result.dart';
import 'package:flutter_application_7/screens/statistics.dart';
import 'package:flutter_application_7/widgets/appbar.dart';
import 'package:flutter_application_7/widgets/drawer.dart';
import './screens/home.dart';
import './values/colors.dart' as custom_colors;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_provider/flutter_provider.dart';

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
  @override
  void initState() {
    super.initState();

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
