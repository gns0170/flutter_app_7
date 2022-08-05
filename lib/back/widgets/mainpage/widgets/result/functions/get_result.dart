import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/achievement_popup/model.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/check_weight.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/achievement/functions/achievement_record.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/data/results.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/functions/result_record.dart';
import 'package:flutter_application_7/front/mainpage/common/popup.dart';

class GetResult extends ChangeNotifier {
  CheckWeight checkWeight;
  RecordResult recordR;
  RecordAchievement recordA;
  ProviderPopup popup;

  GetResult(this.checkWeight, this.recordR, this.recordA, this.popup);

  void initState() {}

  DataResult getResult() {
    DataResult result;
    int indexPlayStyle;
    int indexPosition;
    int indexComposed;

    //Weight 합해서 Result 찾기
    indexPlayStyle = indexMaxOfList(checkWeight.weightPlayStyle);
    indexPosition = indexMaxOfList(checkWeight.weightPosition);

    indexComposed = indexPosition * 4 + indexPlayStyle;

    result = r[indexComposed];

    checkRecord(indexComposed); // 결과/업적 달성 여부 확인 && local Storage 에 저장.

    return result;
  }

  void checkRecord(int indexComposed) {
    //Record 조건 체크 후 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Record에 Result 저장하기
      recordR.updateRecordR(indexComposed);

      //Achievement 달성 여부 확인
      recordA.updateRecordA();

      //achievement 팝업 작동
      popup.achievementAlarmOnOff();
      initPopUpAchievement();

      //저장
      recordR.saveRecordR();
    });
  }
}
