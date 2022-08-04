import 'package:flutter/material.dart';
import 'package:flutter_application_7/front/mainpage/widgets/result/widgets/result_context.dart';
import 'package:flutter_application_7/front/mainpage/widgets/result/widgets/result_graph1.dart';
import 'package:flutter_application_7/front/mainpage/widgets/result/widgets/result_graph2.dart';

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//views
  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 3, vsync: this);
    globalTabController = _tabController;
    return TabBarView(
      controller: _tabController,
      children: const [
        ResultContext(),
        ResultGraph1(),
        ResultGraph2(),
      ],
    );
  }
}
