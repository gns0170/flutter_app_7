import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/data/questions.dart';
import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/widgets/parts/button.dart';
import 'package:flutter_application_7/front/widgets/parts/layout.dart';
import 'package:flutter_application_7/front/widgets/parts/texts.dart';

import 'package:provider/provider.dart';

import './home.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<DataQuestion> dataQuestions = q;
  String semiKey = 'q21';
  int semiNumberPage = 1;

  @override
  Widget build(BuildContext context) {
    var providerNavigation = context.watch<ProviderNavigation>();

    //ad 레이아웃
    var purchase = context.read<DashPurchases>();

    //data Process
    dynamic shownQuestion;
    void selectQuestion() {
      setState(() {
        shownQuestion = q.singleWhere((element) => element.key == semiKey);
      });
    }

    selectQuestion();

    //페이지 전환
    void changePage() {
      if (semiNumberPage == 10) {
        providerNavigation.changePage(MainPage.result);
      } else {
        semiNumberPage++;
      }
    }

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
                  changePage();
                  proAddWeight(shownQuestion.options[index].weightStyle);
                  proAddWeightPosition(
                      shownQuestion.options[index].weightPosition);
                  semiKey = shownQuestion.options[index].nextKey;
                  selectQuestion();
                },
                height: 50,
              );
            }),
      ),
      const Spacer(flex: 2),
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
