import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/record.dart';

class DataAchievement {
  String title;
  String text;
  dynamic icon;
  dynamic cases = false;

  DataAchievement(this.title, this.text, this.icon, {this.cases});
}

Widget iconBasicA =
    const Text('?', style: TextStyle(fontSize: 40, color: Colors.black87));

List<DataAchievement> a = [
  DataAchievement("1번 항목", "1번 설명", "Bar"),
  DataAchievement("1번 achieve", "1번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("2번 achieve", "1번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("3번 achieve", "1번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("2번 항목", "1번 설명", "Bar"),
  DataAchievement("1번 achieve", "2번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("2번 achieve", "2번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("3번 achieve", "2번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("3번 항목", "1번 설명", "Bar"),
  DataAchievement("1번 achieve", "3번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("2번 achieve", "3번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("3번 achieve", "3번 설명",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
];

class CheckAcases {
  List<bool> aCases = [
    false,
    recordR[0] != 0 ? true : false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    1 is bool ? true : false,
  ];
  CheckAcases();
  void setRecordAByAcases() {
    for (int i = 0; i < a.length; i++) {
      recordA[i] = aCases[i] == true ? 1 : recordA[i];
    }
  }
}

void setAchievementCasesByRecord() {
  for (int i = 0; i < a.length; i++) {
    a[i].cases = recordA[i] == 0 ? false : true;
  }
}
