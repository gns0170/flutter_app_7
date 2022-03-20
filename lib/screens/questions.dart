import 'package:flutter/material.dart';
import 'package:flutter_application_7/widgets/button.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import 'package:flutter_application_7/widgets/view.dart';
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
      const Spacer(flex: 1),
      SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: 250,
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
      const Spacer(flex: 5),
      theNumberQuestions(semiNumberPage),
      const SizedBox(height: 30)
    ]));
  }
}

Widget theNumberQuestions(dynamic number) {
  return Container(
    child: Center(
        child: TextQuestion(
      words: number.toString() + '/10',
    )),
  );
}
