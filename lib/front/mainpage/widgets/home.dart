import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/functions/select_correct_result/check_weight.dart';
import 'package:flutter_application_7/front/mainpage/common/button.dart';
import 'package:flutter_application_7/front/mainpage/common/layout.dart';
import 'package:flutter_application_7/front/mainpage/navigation.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/statistics/functions/statistics_record.dart';
import 'package:provider/provider.dart';

import '../common/texts.dart' as custom_text;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

List<int> testInt = [1, 2, 3, 4];

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var firebaseNotifier = context.watch<FirebaseNotifier>();
    var providerNavigation = context.watch<MainNavigation>();
    var checkWeight = context.watch<CheckWeight>();
    var recordS = context.watch<RecordStatistic>();

    if (firebaseNotifier.isLoggingIn) {
      firebaseNotifier.login();
    }

    //views
    return centerColumn([
      const Spacer(flex: 3),
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: custom_text.TextQuestion(words: '당신에게 가장 어울리는 포지션은?')),
      const SizedBox(height: 20),
      DarkButton(
        text: "시작!",
        width: 115,
        height: 63,
        fontStyle: const TextStyle(
            color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        onPressed: () {
          providerNavigation.changePage(MainPage.question);
          //성향, 포지션 점수 초기화
          checkWeight.initWeights();

          //통계 수정
          recordS.updateRecordS(0);
        },
      ),
      const Spacer(flex: 3),
      DarkButton(
          text: "나는 롤을 모른다!",
          height: 50,
          onPressed: () {
            // setState(() {
            //   firebaseNotifier.login();
            // });
            // //local storage init
            // initLocalRecord();
          },
          icon: Icons.reply),
      const SizedBox(height: 10),
    ]);
  }
}
