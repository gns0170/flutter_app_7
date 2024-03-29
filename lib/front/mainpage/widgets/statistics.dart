import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/statistics/data/statistics.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/statistics/functions/statistics_record.dart';
import 'package:flutter_application_7/front/mainpage/common/texts.dart';

import 'package:flutter_application_7/front/mainpage/common/values/colors.dart'
    as custom_colors;
import 'package:provider/provider.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  StatisticsState createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    var recordStatistics = context.watch<RecordStatistic>();
    //간략화
    List<int> recordS = recordStatistics.recordS;

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: custom_colors.primaryColor5.withOpacity(0.7),
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const TextQuestion(words: "통계"),
              DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('업적',
                            style: TextStyle(fontStyle: FontStyle.italic))),
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('')),
                    DataColumn(
                        label: Text('횟수',
                            style: TextStyle(fontStyle: FontStyle.italic))),
                  ],
                  rows: List<DataRow>.generate(
                      s.length,
                      (int index) => DataRow(cells: [
                            DataCell(Text(s[index].title)),
                            const DataCell(Text('')),
                            const DataCell(Text('')),
                            DataCell(Text(
                                recordS[index].toString() + s[index].unit)),
                          ])))
            ],
          )),
        ));
  }
}
