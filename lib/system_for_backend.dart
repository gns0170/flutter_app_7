import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/functions/achievement_popup/achievement_show.dart';
import 'package:flutter_application_7/front/main_page.dart';
import 'package:flutter_application_7/front/pages/achievements/achievement.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/provider/popup.dart';
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

    return const Scaffold(body: Pages());
  }
}
