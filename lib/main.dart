import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/back/functions/achievement_record.dart';
import 'package:flutter_application_7/back/functions/in_app_purchase/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/functions/in_app_purchase/repo/iap_repo.dart';
import 'package:flutter_application_7/back/functions/result_record.dart';
import 'package:flutter_application_7/back/functions/select_correct_result/check_weight.dart';
import 'package:flutter_application_7/back/functions/statistics_record.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/provider/popup.dart';
import 'package:flutter_application_7/back/functions/switch.dart';
import 'package:flutter_application_7/system_event.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_7/front/provider/values/colors.dart'
    as custom_colors;
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
    //Front
    ChangeNotifierProvider<FirebaseNotifier>(
        create: (_) => FirebaseNotifier()), //파이어베이스
    ChangeNotifierProvider<IAPRepo>(
      create: (context) => IAPRepo(context.read<FirebaseNotifier>()), //IAP
    ),
    ChangeNotifierProvider<ProviderUpgrade>(
        create: ((context) =>
            ProviderUpgrade(context.read<FirebaseNotifier>()))), //광고 업그레이드 결제
    ChangeNotifierProvider<DashPurchases>(
      create: (context) => DashPurchases(context.read<ProviderUpgrade>(),
          context.read<FirebaseNotifier>(), context.read<IAPRepo>()),
      lazy: false,
    ), //IAP 결제
    ChangeNotifierProvider<ProviderPopup>(
        create: (_) => ProviderPopup()), //스크린 팝업
    ChangeNotifierProvider<ProviderNavigation>(
        create: (_) => ProviderNavigation()), //네비게이션

    //Back
    ChangeNotifierProvider<RecordResult>(create: (_) => RecordResult()),
    ChangeNotifierProvider<RecordAchievement>(
        create: (context) => RecordAchievement(context.read<RecordResult>())),
    ChangeNotifierProvider<RecordStatistic>(create: (_) => RecordStatistic()),
    ChangeNotifierProvider<CheckWeight>(
        create: (context) => CheckWeight(context.read<ProviderPopup>(),
            context.read<RecordResult>(), context.read<RecordAchievement>())),
  ], child: mainWidget);
}

//앱 루트, 기능 시작만.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
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
        home: const SystemEvent());
  }
}
