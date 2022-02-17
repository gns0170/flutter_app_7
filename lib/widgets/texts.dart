import 'package:flutter/material.dart';

Widget testText(words, BuildContext context) {
  return Text(words, style: Theme.of(context).textTheme.headline4);
}

class TestQuestion extends StatefulWidget {
  const TestQuestion({Key? key, required this.words}) : super(key: key);

  final dynamic words;
  @override
  _TestQuestionState createState() => _TestQuestionState();
}

class _TestQuestionState extends State<TestQuestion> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.words,
        style: const TextStyle(
            color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600));
  }
}
