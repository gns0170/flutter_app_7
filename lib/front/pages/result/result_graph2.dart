import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/front/pages/home.dart';
import 'package:flutter_application_7/front/pages/result/result.dart';
import 'package:flutter_application_7/front/pages/result/result_context.dart';
import 'package:flutter_application_7/front/widgets/parts/layout.dart';
import 'package:flutter_application_7/front/widgets/parts/texts.dart';

import 'package:provider/provider.dart';
import '../../widgets/parts/button.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:flutter_application_7/front/provider/values/colors.dart'
    as custom_color;

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
    //ad 레이아웃
    var purchase = context.read<DashPurchases>();

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
                      globalTabController?.index = 0.bitLength;
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
      purchase.adUpgrade == false
          ? const Spacer(flex: 2)
          : const Spacer(flex: 1),
      title(),
      Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width - 40,
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: charts.PieChart<String>(shownWeight(),
            defaultRenderer: charts.ArcRendererConfig(arcRendererDecorators: [
              charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.auto)
            ]),
            animate: false),
      ),
      const SizedBox(height: 20),
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
