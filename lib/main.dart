import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/record.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';
import 'package:flutter_application_7/screens/questions.dart';
import 'package:flutter_application_7/screens/result/result.dart';
import 'package:flutter_application_7/widgets/appbar.dart';
import './screens/home.dart';
import './values/colors.dart' as custom_colors;
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
          appBar: baseAppBar,
          body: MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => const Home(),
              '/question': (context) => const Question(),
              '/result': (context) => const Result(),
              '/achievement': (context) => const Achievement(),
            },
          ),
        ));
  }
}
