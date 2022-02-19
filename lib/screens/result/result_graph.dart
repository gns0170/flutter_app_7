import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/home.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import 'package:flutter_application_7/widgets/view.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

//second Screen
class ResultGraph1 extends StatefulWidget {
  const ResultGraph1({Key? key}) : super(key: key);

  @override
  _ResultGraph1State createState() => _ResultGraph1State();
}

class TestData {
  String name;
  int weight;

  TestData(this.name, this.weight);
}

class _ResultGraph1State extends State<ResultGraph1> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<TestData, String>> shownWeight() {
      List<TestData> proWeight = [
        TestData("1", 0),
        TestData("2", 0),
        TestData("3", 0),
        TestData("4", 0),
      ];
      int minWeight = globalWeight.reduce(min);
      for (int index = 0; index < 4; index++) {
        proWeight[index].weight = globalWeight[index] - minWeight + 1;
      }

      return [
        charts.Series<TestData, String>(
          id: "WeightStyle",
          domainFn: (TestData semi, _) => semi.name,
          measureFn: (TestData semi, _) => semi.weight,
          data: proWeight,
          labelAccessorFn: (TestData semi, _) => '${semi.name}:${semi.weight}',
        )
      ];
    }

    return Scaffold(
        body: centerColumn([
      const TextTitleResultGraph(
        words: '포지션 적합도',
      ),
      const SizedBox(height: 25),
      Container(
        //padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
        color: Colors.white,
        width: MediaQuery.of(context).size.width - 40,
        height: 400,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
          child: charts.PieChart<String>(shownWeight(),
              defaultRenderer: charts.ArcRendererConfig(arcRendererDecorators: [
                charts.ArcLabelDecorator(
                    labelPosition: charts.ArcLabelPosition.auto)
              ]),
              animate: false),
        ),
      ),
    ]));
  }
}
