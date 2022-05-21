import 'package:flutter/material.dart';
import 'dart:developer';
import '../values/colors.dart' as custom_colors;

import 'package:flutter_application_7/widgets/parts/texts.dart';

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
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('총 시도 횟수')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('5회')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('본 결과 종류')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('20회')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('업적 달성 수')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('20회')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('본 결과 종류')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('20회')),
                    ],
                  ),
                ],
              )
            ],
          )),
        ));
  }
}
