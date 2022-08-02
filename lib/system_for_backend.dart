import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/functions/achievement_popup/achievement_show.dart';
import 'package:flutter_application_7/front/main_page.dart';
import 'package:flutter_application_7/front/pages/achievements/achievement.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/provider/popup.dart';
import 'package:flutter_application_7/front/widgets/parts/hardware/popup_backbtn.dart';
import 'package:flutter_application_7/front/widgets/parts/iap_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

class SystemForBackEnd extends StatefulWidget {
  const SystemForBackEnd({Key? key}) : super(key: key);
  @override
  _SystemForBackEndState createState() => _SystemForBackEndState();
}

class _SystemForBackEndState extends State<SystemForBackEnd> {
  DateTime? backbuttonpressedTime; // back button time for home

  @override
  Widget build(BuildContext context) {
    //Provider - Navigation / Pop Up
    var providerNavigation = context.watch<ProviderNavigation>();
    var providerPopUp = context.watch<ProviderPopup>();
    var mainNavigator = context.watch<ProviderNavigation>();

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
                return const PurchasePopUp();
              });
        }
      });
    });

    /// 하드웨어 컨트롤

    //뒤로가기 설정
    Future<bool> backButtonPressed() async {
      final now = DateTime.now();
      if (mainNavigator.pageView == MainPage.home) {
        if (backbuttonpressedTime == null ||
            now.difference(backbuttonpressedTime!) >
                const Duration(seconds: 3)) {
          Fluttertoast.showToast(
              msg: "Double Click to exit app",
              backgroundColor: Colors.black,
              textColor: Colors.white);
          backbuttonpressedTime = DateTime.now();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
        // }
      } else {
        showDialog(
            context: context,
            builder: (context) => const PopUpBackButtonPressed());
        return Future.value(false);
      }
    }

    //BackButton Controlling
    Widget backButtonControl(pageName) {
      return WillPopScope(
          child: pageName, onWillPop: () => backButtonPressed());
    }

    // Execution Code
    return Scaffold(body: backButtonControl(const Pages()));
  }
}
