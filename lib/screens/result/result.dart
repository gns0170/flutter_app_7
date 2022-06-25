import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/achievements.dart';
import 'package:flutter_application_7/data/record.dart';
import 'package:flutter_application_7/data/results.dart';
import 'package:flutter_application_7/main.dart';
import 'package:flutter_application_7/provider/refer_value.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/home.dart';
import 'package:flutter_application_7/screens/result/result_graph2.dart';
import 'package:provider/provider.dart';

import 'dart:math';
import 'result_context.dart';
import 'result_graph1.dart';

//List
class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

dynamic globalTabController;

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  //related variables

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    globalTabController = _tabController;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //dataProcess
  DataResult selectResult() {
    int maxWeight = globalWeight.reduce(max);
    int maxWeightPosition = globalWeightPosition.reduce(max);
    int index;
    int indexPosition;
    DataResult proResult;
    var providerPopUp = context.watch<ProviderPopup>();
    //RecordA check for achievement View
    List<int> tempRecordA = recordA;

    for (index = 0; globalWeight[index] != maxWeight; index++) {}
    for (indexPosition = 0;
        globalWeightPosition[indexPosition] != maxWeightPosition;
        indexPosition++) {}

    int indexComposed = indexPosition * 4 + index;
    proResult = r[indexComposed];
    recordR[indexComposed]++;

    CheckAcases checkCase = CheckAcases();
    checkCase.setRecordAByAcases();

    //RecordA check for achievement view
    for (index = 0; index < recordA.length; index++) {
      if (tempRecordA[index] != recordA[index]) {
        referDas.add(
            DataAchievementShown(a[index].title, a[index].text, a[index].icon));
      }
    }
    providerPopUp.achievementAlarmOnOff();
    initReferDas();

    //end the record
    R.saveRecord();

    return proResult;
  }

//views
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        ResultContext(proResult: selectResult()),
        const ResultGraph1(),
        const ResultGraph2(),
      ],
    );
  }
}
