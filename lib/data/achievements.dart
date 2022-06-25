import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/record.dart';

class DataAchievement {
  int pNumber;
  String title;
  String text;
  dynamic icon;
  dynamic cases = false;

  DataAchievement(this.pNumber, this.title, this.text, this.icon, {this.cases});
}

//Basic data
Widget iconBasicA =
    const Text('?', style: TextStyle(fontSize: 40, color: Colors.black87));

//data
List<DataAchievement> a = [
  DataAchievement(0, "1번 항목", "1번 설명", "Bar"),
  //1
  DataAchievement(1, "포화 속으로", "화려한 결과를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //2
  DataAchievement(2, "생각하는 기계", "정교한 결과를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //3
  DataAchievement(3, "사회적 동물", "협력적인 결과를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //4
  DataAchievement(4, "오, 어머니…", "숭고한 결과를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement(0, "2번 항목", "1번 설명", "Bar"),
  //5
  DataAchievement(5, "죽음이 두렵지 않은", "탑을 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //6
  DataAchievement(6, "아 맞다 강타!", "정글을 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //7
  DataAchievement(7, "뭐든 가능한 사람", "미드를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //8
  DataAchievement(8, "집중, 또 집중!", "원딜을 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //9
  DataAchievement(9, "서포터야, 고마워!", "서포터를 전부 얻은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement(0, "3번 항목", "1번 설명", "Bar"),
  //10
  DataAchievement(10, "그런거 일부러 찾는 사람", "숭고한 원딜 결과 창을 본 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //11
  DataAchievement(11, "소문난 망나니", "3연속 탑만 결과로 나온 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //12
  DataAchievement(12, "의문의 중국 오리 장인", "정교한 미드에서 표식을 찾은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //13
  DataAchievement(13, "영원히 기억될 그 이름", "화려한 미드에서 표식을 찾은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  DataAchievement(0, "4번 항목", "1번 설명", "Bar"),
  //14
  DataAchievement(15, "전인", "모든 결과를 찾은 사람",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
  //15
  DataAchievement(16, "자강두천", "자존심 강한 두 천재의 대결",
      const Text('!', style: TextStyle(fontSize: 40, color: Colors.black87))),
];

//cases
class CheckAcases {
  List<bool> aCases = [
    false,
    //1
    recordR[0] == 1 &&
            recordR[4] == 1 &&
            recordR[8] == 1 &&
            recordR[12] == 1 &&
            recordR[16] == 1
        ? true
        : false,
    recordR[1] == 1 &&
            recordR[5] == 1 &&
            recordR[9] == 1 &&
            recordR[13] == 1 &&
            recordR[17] == 1
        ? true
        : false,
    recordR[2] == 1 &&
            recordR[6] == 1 &&
            recordR[10] == 1 &&
            recordR[14] == 1 &&
            recordR[18] == 1
        ? true
        : false,
    recordR[3] == 1 &&
            recordR[7] == 1 &&
            recordR[11] == 1 &&
            recordR[15] == 1 &&
            recordR[19] == 1
        ? true
        : false,
    //2
    recordR[0] == 1 && recordR[1] == 1 && recordR[2] == 1 && recordR[3] == 1
        ? true
        : false,
    recordR[4] == 1 && recordR[5] == 1 && recordR[6] == 1 && recordR[7] == 1
        ? true
        : false,
    recordR[8] == 1 && recordR[9] == 1 && recordR[10] == 1 && recordR[11] == 1
        ? true
        : false,
    recordR[12] == 1 && recordR[13] == 1 && recordR[14] == 1 && recordR[15] == 1
        ? true
        : false,
    recordR[16] == 1 && recordR[17] == 1 && recordR[18] == 1 && recordR[19] == 1
        ? true
        : false,
    //3
    false,
    false,
    false,
    false,
    false,
    //4
    ach4_1(),
    false,
  ];
  CheckAcases();
  void setRecordAByAcases() {
    for (int i = 0; i < recordA.length; i++) {
      recordA[i] = aCases[a[i].pNumber] == true ? 1 : recordA[i];
    }
  }
}

//전인
bool ach4_1() {
  bool b = true;
  for (int i = 0; i < 17; i++) {
    b = recordA[i] == 1 ? b : false;
  }
  return b;
}
