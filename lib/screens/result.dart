import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/results.dart';
import 'package:flutter_application_7/widgets/button.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import 'package:flutter_application_7/widgets/view.dart';
import './home.dart';
import 'dart:math';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

dynamic _globalTabController;

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _globalTabController = _tabController;
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

//first Screen
class ResultContext extends StatefulWidget {
  const ResultContext({Key? key}) : super(key: key);

  @override
  _ResultContextState createState() => _ResultContextState();
}

class _ResultContextState extends State<ResultContext> {
  Widget shownResultText = Container();
  Widget shownResultTitle = Container();

  void selectShownResult() {
    int maxWeight = shownWeight.reduce(max);
    int index;
    dynamic proResult;
    for (index = 0; shownWeight[index] != maxWeight; index++) {}
    setState(() {
      proResult = r[index];
      shownResultText = proResult.explain;
      shownResultTitle = proResult.title;
    });
  }

  Widget buttons() {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        DarkerButton(
            text: '그래프로 보기',
            onPressed: () {
              setState(() {
                _globalTabController?.index = 1;
              });
            },
            iconDetail: const Icon(
              Icons.arrow_right_alt,
              size: 50,
              color: Colors.white,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            DarkButton(
              text: "업적",
              onPressed: () {},
              width: 180,
              height: 70,
            ),
            const Spacer(flex: 1),
            DarkButton(
              text: "공유하기",
              onPressed: () {},
              width: 180,
              height: 70,
              icon: Icons.share,
            ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 5),
        DarkButton(
            text: "처음으로",
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    selectShownResult();
    return Scaffold(
        body: centerColumn([
      shownResultTitle,
      const SizedBox(height: 6),
      views(shownResultText, context, 400),
      buttons(),
      Text(shownWeight.toString())
    ]));
  }
}

//second Screen
class ResultGraph extends StatefulWidget {
  const ResultGraph({Key? key}) : super(key: key);

  @override
  _ResultGraphState createState() => _ResultGraphState();
}

class _ResultGraphState extends State<ResultGraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: centerColumn([
      TextQuestion(words: '1234'),
      views(Text("123"), context, 400),
    ]));
  }
}
