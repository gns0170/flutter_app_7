import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/check_weight.dart';
import 'package:flutter_application_7/front/mainpage/common/button.dart';
import 'package:flutter_application_7/front/mainpage/common/layout.dart';
import 'package:flutter_application_7/front/mainpage/common/texts.dart';
import '../common/button.dart';
import '../common/spacer.dart';
import '../index.dart';

import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:flutter_application_7/front/mainpage/common/values/colors.dart'
    as custom_color;

//second Screen
class ResultGraph1 extends StatefulWidget {
  const ResultGraph1({Key? key}) : super(key: key);

  @override
  _ResultGraph1State createState() => _ResultGraph1State();
}

class ChartData {
  String name;
  int weight;
  dynamic color;

  ChartData(this.name, this.weight, this.color);
}

class _ResultGraph1State extends State<ResultGraph1> {
  @override
  Widget build(BuildContext context) {
    var checkWeight = context.watch<CheckWeight>();

    //List 데이터
    List<charts.Series<ChartData, String>> shownWeight() {
      List<ChartData> dataList = [
        ChartData("화려한", 0, custom_color.primaryColor3.withOpacity(1)),
        ChartData("정교한", 0, custom_color.primaryColor3.withOpacity(0.8)),
        ChartData("협력하는", 0, custom_color.primaryColor3.withOpacity(0.6)),
        ChartData("숭고한", 0, custom_color.primaryColor3.withOpacity(0.4)),
      ];

      //List 내에서의 최대/최솟값
      int minWeight = checkWeight.weightPlayStyle.reduce(min);
      int maxWeight = checkWeight.weightPlayStyle.reduce(max);
      int sum = 0;

      for (int index = 0; index < 4; index++) {
        //차트 가중치 조정
        dataList[index].weight =
            checkWeight.weightPlayStyle[index] + maxWeight - minWeight;
        //차트 가중치 총합
        sum += dataList[index].weight;
      }

      return [
        charts.Series<ChartData, String>(
          id: "WeightStyle",
          domainFn: (ChartData data, _) => data.name,
          measureFn: (ChartData data, _) => data.weight,
          colorFn: (ChartData data, _) =>
              charts.ColorUtil.fromDartColor(data.color),
          data: dataList,
          labelAccessorFn: (ChartData data, _) =>
              '${data.name}\n${(data.weight / sum * 1000).toInt() / 10}%',
        )
      ];
    }

    //Views
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
                      globalTabController?.index = 0;
                    },
                    icon: const Icon(Icons.navigate_before,
                        color: Colors.white, size: 30)),
                const Spacer(flex: 1),
                const TextTitleResultGraph(words: '플레이 성향'),
                const Spacer(flex: 1),
                IconButton(
                    onPressed: () {
                      globalTabController?.index = 2;
                    },
                    icon: const Icon(Icons.navigate_next,
                        color: Colors.white, size: 30)),
              ]),
            ),
            const SizedBox(height: 23)
          ]));
    }

    return Scaffold(
        body: centerColumn([
      const SpacerResult(number: 0),
      title(),
      Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width - 40,
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: charts.PieChart<String>(
          shownWeight(),
          defaultRenderer: charts.ArcRendererConfig(arcRendererDecorators: [
            charts.ArcLabelDecorator(
                labelPosition: charts.ArcLabelPosition.auto)
          ]),
          animate: false,
          behaviors: [
            charts.DatumLegend(
                position: charts.BehaviorPosition.end,
                cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                showMeasures: false,
                legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                measureFormatter: (value) {
                  return '';
                })
          ],
        ),
      ),
      const SizedBox(height: 15),
      DarkerButton(
        text: '결과 첫 화면',
        onPressed: () {
          globalTabController?.index = 0;
        },
      ),
      const Buttons(),
      const Spacer(flex: 1),
    ]));
  }
}
