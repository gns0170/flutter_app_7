import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/back/connection/local/record.dart';
import 'package:flutter_application_7/back/data/results.dart';

class ResultState extends ChangeNotifier {
  late List<int> _recordR = [];
  List<int> get recordR => _recordR;

  ResultState() {
    Future.delayed(Duration.zero, () {
      initRecordR();
    });
  }

  void initRecordR() {
    dynamic saved = loadLocalRecord('recordA');
    //이미 내용이 있는가?
    if (saved is List<int>) {
      //덮어 씌우기
      _recordR = saved;
    } else {
      //완전 초기화
      for (int i = 0; i < r.length; i++) {
        if (_recordR.length < r.length) {
          _recordR.add(0);
        }
      }
    }
    notifyListeners();
  }

  void updateRecordR(int i) {
    _recordR[i]++;
    notifyListeners();
  }

  void saveRecordR() {
    saveLocalRecord(recordR, 'recordR');
    notifyListeners();
  }
}
