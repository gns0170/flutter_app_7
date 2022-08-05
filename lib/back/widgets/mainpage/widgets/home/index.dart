import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/statistics/functions/statistics_record.dart';
import 'package:flutter_application_7/front/mainpage/navigation.dart';

class HomeBack extends ChangeNotifier {
  FirebaseNotifier firebaseNotifier;
  MainNavigation mainNavigation;
  RecordStatistic recordS;

  HomeBack(this.firebaseNotifier, this.mainNavigation, this.recordS);

  void initState() {
    if (firebaseNotifier.isLoggingIn) {
      firebaseNotifier.login();
    }
  }

  Future<void> goToQuestion() async {
    mainNavigation.changePage(MainPage.question); // 다음 페이지로
    recordS.updateRecordS(0); // Start 통계 +1
  }
}
