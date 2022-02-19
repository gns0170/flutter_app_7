import 'package:flutter/material.dart';

class TextQuestion extends StatefulWidget {
  const TextQuestion({Key? key, required this.words, this.color})
      : super(key: key);

  final dynamic color;
  final dynamic words;
  @override
  _TextQuestionState createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.words,
      style: TextStyle(
          color: widget.color ?? Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class TextExplain extends StatefulWidget {
  const TextExplain({Key? key, required this.words}) : super(key: key);

  final dynamic words;
  @override
  _TextExplainState createState() => _TextExplainState();
}

class _TextExplainState extends State<TextExplain> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.words,
      style: const TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}

class TextTitleResultGraph extends StatefulWidget {
  const TextTitleResultGraph({Key? key, required this.words}) : super(key: key);

  final dynamic words;
  @override
  _TextTitleResultGraph createState() => _TextTitleResultGraph();
}

class _TextTitleResultGraph extends State<TextTitleResultGraph> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.words,
      style: const TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
    );
  }
}
