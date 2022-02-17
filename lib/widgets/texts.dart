import 'package:flutter/material.dart';

class TextQuestion extends StatefulWidget {
  const TextQuestion({Key? key, required this.words}) : super(key: key);

  final dynamic words;
  @override
  _TextQuestionState createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.words,
      style: const TextStyle(
          color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
