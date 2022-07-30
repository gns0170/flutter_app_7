import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/back/connection/local/record.dart';

import 'package:flutter_application_7/back/data/statistics.dart';

//조건이 성립하면 통계를 업데이트 합니다.
class RecordStatistic extends ChangeNotifier {
  late List<int> _recordS;

  List<int> get recordS => _recordS;

  RecordStatistic() {
    Future.delayed(Duration.zero, () {
      initRecordS();
    });
  }

  void initRecordS() {
    dynamic saved = loadLocalRecord('recordS');
    //이미 내용이 있는가?
    if (saved is List<int>) {
      //덮어 씌우기
      _recordS = saved;
    } else {
      //완전 초기화
      for (int i = 0; i < s.length; i++) {
        if (_recordS.length < s.length) {
          _recordS.add(0);
        }
      }
    }
    notifyListeners();
  }

  void updateRecordS(int i) {
    _recordS[i]++;
    notifyListeners();
  }

  void saveRecordS() {
    saveLocalRecord(recordS, 'recordS');
    notifyListeners();
  }
}
