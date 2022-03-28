import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/record.dart';

class DataAchievement {
  String title;
  String text;
  dynamic icon;
  dynamic cases = false;

  DataAchievement(this.title, this.text, this.icon, {this.cases});
}

//Basic data
Widget iconBasicA =
    const Text('?', style: TextStyle(fontSize: 40, color: Colors.black87));

//data
List<DataAchievement> a = [
  DataAchievement("1번 항목", "1번 설명", "Bar"),
  //1
  DataAchievement("나비처럼 날아서", "화려한 결과를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //2
  DataAchievement("차갑지만 아름다운", "정교한 결과를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //3
  DataAchievement("우리는 모두 칭구", "협력적인 결과를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //4
  DataAchievement("대를 위한 희생", "숭고한 결과를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("2번 항목", "1번 설명", "Bar"),
  //5
  DataAchievement("죽음이 두렵지 않은", "탑을 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //6
  DataAchievement("아 맞다 강타!", "정글을 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //7
  DataAchievement("뭐든 가능한 사람", "미드를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //8
  DataAchievement("집중, 또 집중!", "원딜을 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //9
  DataAchievement("서포터야, 고마워!", "서포터를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement("3번 항목", "1번 설명", "Bar"),
  //10
  DataAchievement("포화 속으로", "화려한 점수가 2등의 2배 이상 높다.",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //11
  DataAchievement("생각하는 기계", "정밀한 점수가 2등의 2배 이상 높다.",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //12
  DataAchievement("사회적 동물", "협력적인 점수가 2등의 2배 이상 높다.",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //13
  DataAchievement("오, 어머니…", "숭고한 점수가 2등의 2배 이상 높다.",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
];

//cases
class CheckAcases {
  List<bool> aCases = [
    false,
    recordR[0] != 0 ? true : false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    1 is bool ? true : false,
    false,
    1 is bool ? true : false,
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

//about Record
void setAchievementCasesByRecord() {
  for (int i = 0; i < a.length; i++) {
    a[i].cases = recordA[i] == 0 ? false : true;
  }
}
