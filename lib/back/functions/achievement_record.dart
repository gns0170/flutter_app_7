import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/back/connection/local/record.dart';
import 'package:flutter_application_7/back/functions/achievement_popup/model.dart';
import 'package:flutter_application_7/back/functions/result_record.dart';
import 'package:flutter_application_7/back/data/achievements/achievements.dart';
import 'package:flutter_application_7/back/data/achievements/cases.dart';

class AchievementState extends ChangeNotifier {
  late List<int> _recordA = [];
  List<int> get recordA => _recordA;
  ResultState resultState;

  AchievementState(this.resultState) {
    initRecordA();
  }

  void initRecordA() {
    dynamic saved = loadLocalRecord('recordA');
    //이미 내용이 있는가?
    if (saved is List<int>) {
      _recordA = saved;
    } else {
      //데이터 아예 초기화
      for (int i = 0; i < a.length; i++) {
        if (_recordA.length < a.length) {
          _recordA.add(0);
        }
      }
    }
    notifyListeners();
  }

  //정해둔 조건에 만족하면 record 업데이트
  void updateRecordA() {
    for (int i = 0; i < recordA.length; i++) {
      if (_recordA[i] == 0 &&
          aCases(resultState.recordR, _recordA)[a[i].pNumber] == true) {
        _recordA[i] = 1;
        //achievement Popup에 add 하기
        changePopUpAchievement(i);
      }
    }
    notifyListeners();
  }

  void saveRecordA() {
    saveLocalRecord(recordA, 'recordA');
    notifyListeners();
  }
}
