import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/home.dart';
import 'package:flutter_application_7/screens/result/result.dart';
import 'package:flutter_application_7/screens/result/result_context.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import '../../values/colors.dart' as custom_color;

//second Screen
class ResultGraph2 extends StatefulWidget {
  const ResultGraph2({Key? key}) : super(key: key);

  @override
  _ResultGraph2State createState() => _ResultGraph2State();
}

class TestData {
  String name;
  int weight;
  dynamic color;

  TestData(this.name, this.weight, this.color);
}

class _ResultGraph2State extends State<ResultGraph2> {
  @override
  Widget build(BuildContext context) {
    //data Process
    List<charts.Series<TestData, String>> shownWeight() {
      List<TestData> proWeight = [
        TestData("탑", 0, custom_color.primaryColor3.withOpacity(1)),
        TestData("정글", 0, custom_color.primaryColor3.withOpacity(0.83)),
        TestData("미드", 0, custom_color.primaryColor3.withOpacity(0.66)),
        TestData("원딜", 0, custom_color.primaryColor3.withOpacity(0.49)),
        TestData("서포터", 0, custom_color.primaryColor3.withOpacity(0.32)),
      ];
      int minWeight = globalWeightPosition.reduce(min);
      int maxWeight = globalWeightPosition.reduce(max);

      int semiSumWeight = 0;
      for (int index = 0; index < 5; index++) {
        proWeight[index].weight =
            globalWeightPosition[index] + maxWeight - minWeight;
        semiSumWeight = semiSumWeight + proWeight[index].weight;
      }

      return [
        charts.Series<TestData, String>(
          id: "WeightStyle",
          domainFn: (TestData semi, _) => semi.name,
          measureFn: (TestData semi, _) => semi.weight,
          colorFn: (TestData semi, _) =>
              charts.ColorUtil.fromDartColor(semi.color),
          data: proWeight,
          labelAccessorFn: (TestData semi, _) => semi.name.length != 3
              ? ' ${semi.name}\n${(semi.weight / semiSumWeight * 1000).toInt() / 10}%  '
              : '${semi.name} \n ${(semi.weight / semiSumWeight * 1000).toInt() / 10}%',
        )
      ];
    }

    Widget title() {
      return SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 50,
              color: custom_color.primaryColor3,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                    onPressed: () {
                      globalTabController?.index = 1;
                    },
                    icon: const Icon(Icons.navigate_before,
                        color: Colors.white, size: 30)),
                const Spacer(flex: 1),
                const TextTitleResultGraph(words: '선호 포지션'),
                const Spacer(flex: 1),
                IconButton(
                    onPressed: () {
                      globalTabController?.index = 3;
                    },
                    icon: const Icon(Icons.navigate_next,
                        color: Colors.white, size: 30)),
              ]),
            ),
            const SizedBox(height: 23)
          ]));
    }

    //Views
    return Scaffold(
        body: centerColumn([
      title(),
      Container(
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
      const SizedBox(height: 20),
      buttons(context)
    ]));
  }
}
