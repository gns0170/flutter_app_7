import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/functions/in_app_purchase/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/functions/select_correct_result/check_weight.dart';
import 'package:flutter_application_7/front/common/button.dart';
import 'package:flutter_application_7/front/common/layout.dart';
import 'package:flutter_application_7/front/common/texts.dart';
import 'package:flutter_application_7/front/widgets/result/result.dart';
import 'package:flutter_application_7/front/widgets/result/result_context.dart';

import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:flutter_application_7/front/provider/values/colors.dart'
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
    var purchase = context.read<DashPurchases>();
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

    // //List<int> 에서 최댓값을 구하는 함수
    // int maxWeightOfListInt(List<int> list) {
    //   int maxWeight = list[0];
    //   list.map((element) => element > maxWeight ? maxWeight = element : null);
    //   return maxWeight;
    // }

    // //List<int> 에서 최솟값을 구하는 함수
    // int minWeightOfListInt(List<int> list) {
    //   int minWeight = list[0];
    //   list.map((element) => element < minWeight ? minWeight = element : null);
    //   return minWeight;
    // }

    // List<int> chartWeightAdjust(List<int> list) {
    //   int sum = 0;
    //   List<int> resultList = [];
    //   for (int i = 0; i < list.length; i++) {
    //     resultList
    //         .add(list[i] + maxWeightOfListInt(list) - minWeightOfListInt(list));
    //     sum += resultList[i];
    //   }
    //   return resultList;
    // }

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
      purchase.adUpgrade == false
          ? const Spacer(flex: 2)
          : const Spacer(flex: 1),
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
