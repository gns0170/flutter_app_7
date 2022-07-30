import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/data/questions.dart';
import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/functions/select_correct_result/check_weight.dart';
import 'package:flutter_application_7/back/functions/statistics_record.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/widgets/parts/button.dart';
import 'package:flutter_application_7/front/widgets/parts/layout.dart';
import 'package:flutter_application_7/front/widgets/parts/texts.dart';

import 'package:provider/provider.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String semiKey = 'q21';
  int semiNumberPage = 1;

  //back 중 레코드 부분

  @override
  Widget build(BuildContext context) {
    var providerNavigation = context.watch<ProviderNavigation>();
    var purchase = context.read<DashPurchases>();
    var checkWeight = context.watch<CheckWeight>();

    // var recordStatistics = context.watch<RecordStatistic>();
    //data Process
    dynamic shownQuestion = q.singleWhere((element) => element.key == semiKey);
    Future<void> selectQuestion(index) async {
      checkWeight.addWeightPlayStyle(shownQuestion.options[index].weightStyle);
      checkWeight
          .addWeightPosition(shownQuestion.options[index].weightPosition);
      //provider로 인해 setState 불필요
      shownQuestion = q.singleWhere((element) => element.key == semiKey);
    }

    //페이지 전환
    void changePage() {
      if (semiNumberPage == 10) {
        providerNavigation.changePage(MainPage.result);
      } else {
        semiNumberPage++;
      }
    }

    //TODO: 나중에 selectQuestion 부분은 따로 정리할 수 있도록 하자.
    //TODO: 밑에 변수 정리도 좀 하자.
    //views
    return Scaffold(
        body: centerColumn([
      const Spacer(flex: 3),
      TextQuestion(words: shownQuestion.question),
      purchase.adUpgrade == false
          ? const Spacer(flex: 1)
          : const Spacer(flex: 2),
      SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        height: 370,
        child: ListView.builder(
            itemCount: shownQuestion.options.length,
            itemBuilder: (BuildContext context, int index) {
              return DarkButton(
                text: shownQuestion.options[index].text,
                left: true,
                onPressed: () {
                  //페이지 바꾸기
                  changePage();
                  //결과를 위한 가중치 수정

                  //페이지 전환
                  semiKey = shownQuestion.options[index].nextKey;
                  selectQuestion(index);
                },
                height: 50,
              );
            }),
      ),
      purchase.adUpgrade == false
          ? const Spacer(flex: 2)
          : const Spacer(flex: 1),
      theNumberQuestions(semiNumberPage),
      purchase.adUpgrade == false
          ? const Spacer(flex: 1)
          : const SizedBox(height: 30),
    ]));
  }
}

Widget theNumberQuestions(dynamic number) {
  return SizedBox(
    child: Center(
        child: TextQuestion(
      words: number.toString() + '/10',
    )),
  );
}
