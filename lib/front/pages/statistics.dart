import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/data/statistics.dart';
import 'package:flutter_application_7/front/widgets/parts/texts.dart';
import 'dart:developer';
import 'package:flutter_application_7/front/provider/values/colors.dart'
    as custom_colors;

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  StatisticsState createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    log("Tes12t");
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
                            DataCell(Text('2' + s[index].unit)),
                          ])))
            ],
          )),
        ));
  }
}
