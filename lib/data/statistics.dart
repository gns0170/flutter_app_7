import 'package:flutter/material.dart';

class Statistic {
  final int key;
  final String title;
  final int value;

  Statistic(this.key, this.title, this.value);
}

List<Statistic> s = [
  Statistic(1, "결과를 본 횟수", 0),
  Statistic(1, "결과를 본 횟수", 0),
  Statistic(1, "결과를 본 횟수", 0),
];
