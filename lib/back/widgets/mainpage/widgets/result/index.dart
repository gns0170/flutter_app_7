import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/data/results.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/functions/get_result.dart';

class ResultBack extends ChangeNotifier {
  DashPurchases purchase;
  GetResult getResult;

  ResultBack(this.purchase, this.getResult);

  late DataResult _result;
  DataResult get result => _result;

  void initState() {
    _result = getResult.getResult(); // 바른 결과 가져오기
  }
}
