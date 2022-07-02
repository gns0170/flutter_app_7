import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/functions/iap/model/firebase_state.dart';
import 'package:flutter_application_7/back/functions/iap/model/store_state.dart';
import 'package:flutter_application_7/front/main_page.dart';
import 'package:flutter_application_7/front/pages/achievements/achievement.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/provider/switch.dart';
import 'package:flutter_application_7/front/widgets/parts/achievement_popup/achievement_show.dart';
import 'package:flutter_application_7/front/widgets/parts/iap_widget.dart';

import 'package:provider/provider.dart';

class SystemForBackEnd extends StatefulWidget {
  const SystemForBackEnd({Key? key}) : super(key: key);
  @override
  _SystemForBackEndState createState() => _SystemForBackEndState();
}

class _SystemForBackEndState extends State<SystemForBackEnd> {
  @override
  Widget build(BuildContext context) {
    //Test
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

    return const Scaffold(body: Pages());
  }
}
