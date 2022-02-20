import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/achievements.dart';
import 'package:flutter_application_7/data/record.dart';
import 'package:flutter_application_7/data/results.dart';
import 'package:flutter_application_7/main.dart';
import 'package:flutter_application_7/screens/home.dart';
import 'dart:math';
import 'result_context.dart';
import 'result_graph.dart';

//List
class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

dynamic globalTabController;

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DataResult selectProResult() {
    int maxWeight = globalWeight.reduce(max);
    int index;
    DataResult proResult = r[0];

    for (index = 0; globalWeight[index] != maxWeight; index++) {}
    setState(() {
      proResult = r[index];
      recordR[index]++;
      CheckAcases checkCase = CheckAcases();
      checkCase.setRecordAByAcases();

      R.saveRecord();
    });
    return proResult;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    globalTabController = _tabController;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        ResultContext(proResult: selectProResult()),
        const ResultGraph1(),
      ],
    );
  }
}
