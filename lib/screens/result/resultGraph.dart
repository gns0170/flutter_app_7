import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/home.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import 'package:flutter_application_7/widgets/view.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

//second Screen
class ResultGraph extends StatefulWidget {
  const ResultGraph({Key? key}) : super(key: key);

  @override
  _ResultGraphState createState() => _ResultGraphState();
}

class TestData {
  final String name;
  final int weight;

  TestData(this.name, this.weight);
}

class _ResultGraphState extends State<ResultGraph> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<TestData, String>> shownWeight() {
      List<TestData> proWeight = [
        TestData("1", 2),
        TestData("2", 3),
        TestData("3", 4),
        TestData("4", 5),
      ];
      // int minWeight = globalWeight.reduce(min);
      // for (int index = 0; index < 4; index++) {
      //   proWeight[index] = globalWeight[index] - minWeight + 1;
      // }

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
      views(
          Expanded(
            child: charts.PieChart<String>(shownWeight(),
                defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.inside)
                    ]),
                animate: true),
          ),
          context,
          600),
    ]));
  }
}
