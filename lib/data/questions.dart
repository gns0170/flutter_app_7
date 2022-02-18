import 'package:flutter/material.dart';

class DataQuestion {
  final String key;
  final String question;
  final Widget view;
  final List<Option> options;
  DataQuestion(this.key, this.question, this.view, this.options);
}

class Option {
  final String text;
  final List<int> weight;
  final String nextKey;
  Option(this.text, this.weight, this.nextKey);
}

List<DataQuestion> q = [
  DataQuestion("q1", "Q. 첫번쨰 문제", const Text("123"), [
    Option("1번 답", [3, -1, -1, -1], "q2"),
    Option("2번 답", [1, 1, 1, -3], "q3"),
    Option("3번 답", [-2, -2, 2, 2], "q3"),
  ]),
  DataQuestion("q2", "Q. 두번째 문제", const Text("234"), [
    Option("1번 답", [3, -1, -1, -1], "q1"),
    Option("2번 답", [1, 1, 1, -3], "q3"),
    Option("3번 답", [-2, -2, 2, 2], "q1"),
    Option("4번 답", [-2, -2, 2, 2], "q1"),
  ]),
  DataQuestion("q3", "Q. 세번쨰 문제", const Text("345"), [
    Option("1번 답", [3, -1, -1, -1], "q2"),
    Option("2번 답", [1, 1, 1, -3], "q1"),
  ]),
];
