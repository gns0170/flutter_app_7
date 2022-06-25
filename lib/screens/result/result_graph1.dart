import 'package:flutter/material.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/home.dart';
import 'package:flutter_application_7/screens/result/result.dart';
import 'package:flutter_application_7/screens/result/result_context.dart';
import 'package:flutter_application_7/widgets/adver.dart';
import 'package:flutter_application_7/widgets/parts/layout.dart';
import 'package:flutter_application_7/widgets/parts/texts.dart';
import 'package:provider/provider.dart';

import '../../iap/logic/dash_purchases.dart';
import '../../widgets/parts/button.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import '../../values/colors.dart' as custom_color;

//second Screen
class ResultGraph1 extends StatefulWidget {
  const ResultGraph1({Key? key}) : super(key: key);

  @override
  _ResultGraph1State createState() => _ResultGraph1State();
}

class TestData {
  String name;
  int weight;
  dynamic color;

  TestData(this.name, this.weight, this.color);
}

class _ResultGraph1State extends State<ResultGraph1> {
  @override
  Widget build(BuildContext context) {
    //ad
    myBanner4.load();
    var purchase = context.read<DashPurchases>();
    var providerNavigation = context.watch<ProviderNavigation>();
    //data Process
    List<charts.Series<TestData, String>> shownWeight() {
      List<TestData> proWeight = [
        TestData("화려한", 0, custom_color.primaryColor3.withOpacity(1)),
        TestData("정교한", 0, custom_color.primaryColor3.withOpacity(0.8)),
        TestData("협력하는", 0, custom_color.primaryColor3.withOpacity(0.6)),
        TestData("숭고한", 0, custom_color.primaryColor3.withOpacity(0.4)),
      ];
      int minWeight = globalWeight.reduce(min);
      int maxWeight = globalWeight.reduce(max);
      int semiSumWeight = 0;
      for (int index = 0; index < 4; index++) {
        proWeight[index].weight = globalWeight[index] + maxWeight - minWeight;
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
          labelAccessorFn: (TestData semi, _) =>
              '${semi.name}\n${(semi.weight / semiSumWeight * 1000).toInt() / 10}%',
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
      !purchase.adUpgrade
          ? adContainer(myBanner4, context)
          : const SizedBox(
              height: 10,
            )
    ]));
  }
}
