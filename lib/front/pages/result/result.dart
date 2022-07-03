import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/functions/select_correct_result/check_weight.dart';
import 'package:flutter_application_7/front/pages/result/result_graph2.dart';
import 'package:provider/provider.dart';
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

//views
  @override
  Widget build(BuildContext context) {
    var checkWeight = context.watch<CheckWeight>();
    return TabBarView(
      controller: _tabController,
      children: [
        ResultContext(proResult: checkWeight.correctResult(context)),
        const ResultGraph1(),
        const ResultGraph2(),
      ],
    );
  }
}
