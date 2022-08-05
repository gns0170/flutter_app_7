import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/questions/index.dart';
import 'package:flutter_application_7/front/mainpage/common/button.dart';
import 'package:flutter_application_7/front/mainpage/common/layout.dart';
import 'package:flutter_application_7/front/mainpage/common/texts.dart';
import 'package:flutter_application_7/front/mainpage/widgets/questions/widgets/page_number.dart';
import 'package:flutter_application_7/front/mainpage/widgets/questions/widgets/spacer.dart';
import 'package:provider/provider.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  void initState() {
    super.initState();
    var questionBack = context.read<
        QuestionsBack>(); // 본 함수의 initState 중에는 watch 가 아닌 read 를 써야 rebuild Error을 막을 수 있음.
    questionBack.initState();
  }

  @override
  Widget build(BuildContext context) {
    var questionBack = context.watch<QuestionsBack>();
    var selectedQuestion = questionBack.selectQuestion.selectedQuestion;

    //views
    return Scaffold(
        body: centerColumn([
      const Spacer(flex: 3),
      TextQuestion(words: selectedQuestion.question),
      const SpacerQuestion(number: 0),
      SizedBox(
        //Outer Contaner
        width: MediaQuery.of(context).size.width - 20,
        height: 370,
        child: ListView.builder(
            itemCount: selectedQuestion.options.length,
            itemBuilder: (BuildContext context, int index) {
              return DarkButton(
                text: selectedQuestion.options[index].text,
                left: true,
                onPressed: () {
                  questionBack.nextQuestion(index); // 다음 문제 로드
                },
                height: 50,
              );
            }),
      ),
      const SpacerQuestion(number: 1),
      pageNumber(questionBack.pageNumber),
      const SpacerQuestion(number: 2),
    ]));
  }
}
