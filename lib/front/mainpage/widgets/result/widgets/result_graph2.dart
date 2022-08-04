import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/functions/in_app_purchase/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/functions/select_correct_result/check_weight.dart';
import 'package:flutter_application_7/front/mainpage/common/button.dart';
import 'package:flutter_application_7/front/mainpage/common/layout.dart';
import 'package:flutter_application_7/front/mainpage/common/texts.dart';
import 'package:flutter_application_7/front/mainpage/widgets/result/common/button.dart';
import 'package:flutter_application_7/front/mainpage/widgets/result/index.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:flutter_application_7/front/mainpage/common/values/colors.dart'
    as custom_color;

//second Screen
class ResultGraph2 extends StatefulWidget {
  const ResultGraph2({Key? key}) : super(key: key);

  @override
  _ResultGraph2State createState() => _ResultGraph2State();
}

class ChartData {
  String name;
  int weight;
  dynamic color;

  ChartData(this.name, this.weight, this.color);
}

class _ResultGraph2State extends State<ResultGraph2> {
  @override
  Widget build(BuildContext context) {
    var purchase = context.read<DashPurchases>();
    var checkWeight = context.watch<CheckWeight>();

    //List 데이터
    List<charts.Series<ChartData, String>> shownWeight() {
      List<ChartData> dataList = [
        ChartData("탑", 0, custom_color.primaryColor3.withOpacity(1)),
        ChartData("정글", 0, custom_color.primaryColor3.withOpacity(0.83)),
        ChartData("미드", 0, custom_color.primaryColor3.withOpacity(0.66)),
        ChartData("원딜", 0, custom_color.primaryColor3.withOpacity(0.49)),
        ChartData("서포터", 0, custom_color.primaryColor3.withOpacity(0.32)),
      ];
      //List 내에서의 최대/최솟값
      int minWeight = checkWeight.weightPosition.reduce(min);
      int maxWeight = checkWeight.weightPosition.reduce(max);
      int sum = 0;

      for (int index = 0; index < dataList.length; index++) {
        //차트 가중치 조정
        dataList[index].weight =
            checkWeight.weightPosition[index] + maxWeight - minWeight;
        //차트 가중치 총합
        sum += dataList[index].weight;
      }

      return [
        charts.Series<ChartData, String>(
          id: "WeightPosition",
          domainFn: (ChartData data, _) => data.name,
          measureFn: (ChartData data, _) => data.weight,
          colorFn: (ChartData data, _) =>
              charts.ColorUtil.fromDartColor(data.color),
          data: dataList,
          labelAccessorFn: (ChartData data, _) => data.name.length != 3
              ? ' ${data.name}\n${(data.weight / sum * 1000).toInt() / 10}%  '
              : '${data.name} \n ${(data.weight / sum * 1000).toInt() / 10}%',
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
