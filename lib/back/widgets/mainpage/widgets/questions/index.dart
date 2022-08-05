import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/check_weight.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/questions/data/questions.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/questions/functions/select_question.dart';
import 'package:flutter_application_7/front/mainpage/navigation.dart';

class QuestionsBack extends ChangeNotifier {
  SelectQuestion selectQuestion;
  MainNavigation mainNavigation;
  CheckWeight checkWeight;
  QuestionsBack(this.selectQuestion, this.mainNavigation, this.checkWeight) {
    selectQuestion.initState();
  }

  void initState() {
    selectQuestion.initState();
    checkWeight.initState();
    _pageNumber = 1;
  }

  Future<DataQuestion> nextQuestion(index) async {
    selectQuestion.selectNextQuestion(index); // select next questions
    checkNextPage(); // check page number to go next page
    notifyListeners();
    return selectQuestion.selectedQuestion;
  }

  //Page Change
  int _pageNumber = 1;
  int get pageNumber => _pageNumber;
  Future<void> checkNextPage() async {
    if (_pageNumber == 10) {
      mainNavigation.changePage(MainPage.result);
    } else {
      _pageNumber++;
    }
  }
}
