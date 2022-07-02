import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/back/data/record.dart';
import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/functions/iap/model/firebase_state.dart';
import 'package:flutter_application_7/back/functions/iap/model/store_state.dart';
import 'package:flutter_application_7/back/functions/iap/repo/iap_repo.dart';
import 'package:flutter_application_7/front/pages/achievements/achievement.dart';
import 'package:flutter_application_7/front/pages/home.dart';
import 'package:flutter_application_7/front/pages/questions.dart';
import 'package:flutter_application_7/front/pages/result/result.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/provider/switch.dart';
import 'package:flutter_application_7/front/widgets/adver.dart';
import 'package:flutter_application_7/front/widgets/parts/achievement_popup/achievement_show.dart';
import 'package:flutter_application_7/front/widgets/parts/appbar.dart';
import 'package:flutter_application_7/front/widgets/parts/drawer.dart';
import 'package:flutter_application_7/front/widgets/parts/iap_widget.dart';

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
    var providerNavigation = context.watch<ProviderNavigation>();
    var providerPopUp = context.watch<ProviderPopup>();
    var firebaseNotifier = context.watch<FirebaseNotifier>();
    if (firebaseNotifier.state == FirebaseState.loading) {
      return const PurchasesLoading();
    } else if (firebaseNotifier.state == FirebaseState.notAvailable) {
      return const PurchasesNotAvailable();
    }

    var purchases = context.watch<DashPurchases>();
    var products = purchases.products;

    //backend
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
    R.loadRecord();

    //글로벌 이벤트
    Future.delayed(Duration.zero, () {
      setState(() {
        //Drawer 열기

        if (providerNavigation.achievement == PageStatus.on) {
          providerNavigation.achievementOnOff();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Achievement()));
        }

        //업적 달성시 표시.
        if (providerPopUp.achievementAlarm == PageStatus.on) {
          providerPopUp.achievementAlarmOnOff();
          shownAchieve(context, null, null, null);
        }

        //adPurchase 팝업 다이얼로그 열기.
        if (providerPopUp.adPurchase == PopUpStatus.on) {
          providerPopUp.adPurchaseOnOff();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: SizedBox(
                  height: 250,
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("광고 없애기", style: TextStyle(fontSize: 18)),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: firebaseNotifier.isLoggingIn
                                ? const LoginPage()
                                : storeWidget)
                      ]),
                ));
              });
        }
      });
    });

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
        home: const Page());
  }
}

//메인 페이지 컨트롤러.
class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    var pageProvider = context.watch<ProviderNavigation>();
    var purchase = context.watch<DashPurchases>();
    myBanner.load();

    Widget page = const Home();

    setState(() {
      switch (pageProvider.pageView) {
        case MainPage.home:
          page = const Home();
          break;
        case MainPage.question:
          page = const Question();
          break;
        case MainPage.result:
          page = const Result();
          break;
      }
    });

    return Scaffold(
        appBar: const BaseAppBar(),
        drawer: const Drawer(child: BaseDrawer()),
        body: page,
        bottomNavigationBar: !purchase.adUpgrade
            ? adContainer(myBanner, context)
            : const SizedBox(
                height: 10,
              ));
  }
}
