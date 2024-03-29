import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/achievement_popup/model.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/data/results.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/achievement/functions/achievement_record.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/functions/result_record.dart';
import 'dart:math';
import 'package:flutter_application_7/front/mainpage/common/popup.dart';

//가중치를 계산하고, 이를 통해 적절한 결과를 도출합니다.
class CheckWeight extends ChangeNotifier {
  late List<int> _weightPlayStyle;
  late List<int> _weightPosition;

  List<int> get weightPlayStyle => _weightPlayStyle;
  List<int> get weightPosition => _weightPosition;

  ProviderPopup providerPopUp;
  RecordResult recordResult;
  RecordAchievement recordAchievement;

  CheckWeight(this.providerPopUp, this.recordResult, this.recordAchievement) {
    initState();
  }

  //가중치 초기화
  void initState() {
    _weightPlayStyle = [0, 0, 0, 0];
    _weightPosition = [0, 0, 0, 0, 0];
  }

  //가중치 덧셈 1
  void addWeightPlayStyle(List<int> list) {
    if (list.length == 4) {
      for (int index = 0; index < 4; index++) {
        _weightPlayStyle[index] += list[index];
      }
    }
  }

  //가중치 덧셈 2
  void addWeightPosition(List<int> list) {
    if (list.length == 5) {
      for (int index = 0; index < 5; index++) {
        weightPosition[index] += list[index];
      }
    }
  }

  DataResult getResult() {
    DataResult result;
    int indexPlayStyle;
    int indexPosition;
    int indexComposed;

    //Weight 합해서 Result 찾기
    indexPlayStyle = indexMaxOfList(weightPlayStyle);
    indexPosition = indexMaxOfList(weightPosition);

    indexComposed = indexPosition * 4 + indexPlayStyle;

    result = r[indexComposed];

    checkRecord(indexComposed); // 결과/업적 달성 여부 확인 && local Storage 에 저장.

    return result;
  }

  void checkRecord(int indexComposed) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Record에 Result 저장하기
      recordResult.updateRecordR(indexComposed);

      //Achievement 달성 여부 확인
      recordAchievement.updateRecordA();

      //achievement 팝업 작동
      providerPopUp.achievementAlarmOnOff();
      initPopUpAchievement();

      //저장
      recordResult.saveRecordR();
    });
  }
}

//가중치가 가장 큰 값
int indexMaxOfList(List<int> list) {
  int indexMax = 0;
  indexMax = list.indexOf(list.reduce(max));

  return indexMax;
}
