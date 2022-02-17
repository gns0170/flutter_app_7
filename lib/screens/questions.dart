import 'package:flutter/material.dart';
import 'package:flutter_application_7/widgets/button.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import 'package:flutter_application_7/widgets/view.dart';
import '../data/questions.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<DataQuestion> a = q;
  String words = q[0].question;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: centerColumn([
      const Spacer(flex: 1),
      TextQuestion(words: words),
      const SizedBox(height: 10),
      views(const Text('hi'), context),
      const SizedBox(height: 20),
      SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: 200,
        child: ListView.builder(
            itemCount: q[0].options.length,
            itemBuilder: (BuildContext context, int index) {
              return DarkButton(
                text: q[0].options[index].text,
                onPressed: () {},
                height: 50,
              );
            }),
      ),
      const Spacer(flex: 2),
    ]));
  }
}
