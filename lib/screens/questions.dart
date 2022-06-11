import 'package:flutter/material.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/widgets/adver.dart';
import 'package:flutter_application_7/widgets/parts/button.dart';
import 'package:flutter_application_7/widgets/parts/layout.dart';
import 'package:flutter_application_7/widgets/parts/texts.dart';

import '../data/questions.dart';
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
    //ad
    myBanner2.load();
    Future.delayed(
        Duration.zero,
        () => setState(() {
              homeSwitch.switchAd;
            }));
    //data Process
    dynamic shownQuestion;
    void selectQuestion() {
      setState(() {
        shownQuestion = q.singleWhere((element) => element.key == semiKey);
      });
    }

    selectQuestion();

    //related variables
    void changePage() {
      if (semiNumberPage == 10) {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/result');
      } else {
        semiNumberPage++;
      }
    }

    //views
    return Scaffold(
        body: centerColumn([
      const Spacer(flex: 3),
      TextQuestion(words: shownQuestion.question),
      homeSwitch.switchAd == true
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
      homeSwitch.switchAd == true
          ? const Spacer(flex: 1)
          : const SizedBox(height: 30),
      adContainer(myBanner2, context),
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
