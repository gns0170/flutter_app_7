import 'package:flutter/material.dart';
import 'package:flutter_application_7/widgets/button.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/texts.dart';
import 'package:flutter_application_7/widgets/view.dart';
import './home.dart';
import 'dart:math';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: TabBarView(
          children: [
            ResultContext(),
            ResultGraph(),
          ],
        ));
  }
}

class ResultContext extends StatefulWidget {
  const ResultContext({Key? key}) : super(key: key);

  @override
  _ResultContextState createState() => _ResultContextState();
}

class _ResultContextState extends State<ResultContext> {
  Widget shownResultText = Container();
  Widget shownResultTitle = Container();
  void highestWeight() {
    int maxWeight = shownWeight.reduce(max);
    int index;
    for (index = 0; shownWeight[index] != maxWeight; index++) {}
    setState(() {
      switch (index) {
        case 0:
          shownResultText = const TextExplain(words: "1234");
          shownResultTitle = const TextQuestion(words: "설명 페이지1");
          break;
        case 1:
          shownResultText = const TextExplain(words: "234");
          shownResultTitle = const TextQuestion(words: "설명 페이지2");
          break;
        case 2:
          shownResultText = const TextExplain(words: "345");
          shownResultTitle = const TextQuestion(words: "설명 페이지3");
          break;
        case 3:
          shownResultText = const TextExplain(words: "456");
          shownResultTitle = const TextQuestion(words: "설명 페이지4");
          break;
        default:
          break;
      }
      print(index);
    });
  }

  Widget buttons() {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        DarkerButton(
            text: '그래프로 보기',
            onPressed: () {},
            iconDetail: const Icon(
              Icons.arrow_right_alt,
              size: 50,
              color: Colors.white,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            DarkButton(
              text: "업적",
              onPressed: () {},
              width: 180,
              height: 70,
            ),
            const Spacer(flex: 1),
            DarkButton(
              text: "공유하기",
              onPressed: () {},
              width: 180,
              height: 70,
              icon: Icons.share,
            ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 5),
        DarkButton(text: "처음으로", onPressed: () {})
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    highestWeight();
    return Scaffold(
        body: centerColumn([
      shownResultTitle,
      const SizedBox(height: 6),
      views(shownResultText, context, 400),
      buttons(),
      Text(shownWeight.toString())
    ]));
  }
}

class ResultGraph extends StatefulWidget {
  const ResultGraph({Key? key}) : super(key: key);

  @override
  _ResultGraphState createState() => _ResultGraphState();
}

class _ResultGraphState extends State<ResultGraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: centerColumn([
      TextQuestion(words: '1234'),
      views(Text("123"), context, 400),
    ]));
  }
}
