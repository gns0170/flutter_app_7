import 'package:flutter/material.dart';

import './resultContext.dart';
import './resultGraph.dart';

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
      children: const [
        ResultContext(),
        ResultGraph(),
      ],
    );
  }
}
