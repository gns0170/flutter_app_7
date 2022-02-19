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
  String semiKey = 'q1';
  int semiNumberPage = 1;

  @override
  Widget build(BuildContext context) {
    dynamic shownQuestion;
    void shower() {
      setState(() {
        shownQuestion = q.singleWhere((element) => element.key == semiKey);
      });
    }

    void outerChecker() {
      if (semiNumberPage == 10) {
        Navigator.pop(context, '/');
        Navigator.pushNamed(context, '/result');
      } else {
        semiNumberPage++;
      }
    }

    shower();
    return Scaffold(
        body: centerColumn([
      const Spacer(flex: 1),
      TextQuestion(words: shownQuestion.question),
      const SizedBox(height: 10),
      views(shownQuestion.view, context, 300),
      const SizedBox(height: 20),
      SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: 250,
        child: ListView.builder(
            itemCount: shownQuestion.options.length,
            itemBuilder: (BuildContext context, int index) {
              return DarkButton(
                text: shownQuestion.options[index].text,
                onPressed: () {
                  outerChecker();
                  proAddWeight(shownQuestion.options[index].weightStyle);
                  semiKey = shownQuestion.options[index].nextKey;
                  shower();
                },
                height: 50,
              );
            }),
      ),
      const Spacer(flex: 2),
    ]));
  }
}
