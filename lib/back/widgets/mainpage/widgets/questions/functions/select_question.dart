import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/questions/data/questions.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/check_weight.dart';

//data Process
class SelectQuestion extends ChangeNotifier {
  CheckWeight checkWeight;

  SelectQuestion(this.checkWeight);
  String _key = 'q21'; // for select data

  // Return Data: Selected DataQuestion
  late DataQuestion _selectedQuestion;
  DataQuestion get selectedQuestion => _selectedQuestion;

  void initState() {
    _key = 'q21';
    selectQuestion();
  }

  Future<void> selectQuestion() async {
    _selectedQuestion = q.singleWhere((element) => element.key == _key);
  }

  Future<void> selectNextQuestion(index) async {
    checkWeight.addWeightPlayStyle(selectedQuestion.options[index].weightStyle);
    checkWeight
        .addWeightPosition(selectedQuestion.options[index].weightPosition);
    _key = selectedQuestion.options[index].nextKey;
    selectQuestion();
  }
}
