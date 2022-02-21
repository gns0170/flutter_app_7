import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/results.dart';

import 'package:flutter_application_7/widgets/button.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/view.dart';
import './result.dart';

//first Screen
class ResultContext extends StatefulWidget {
  const ResultContext({Key? key, required this.proResult}) : super(key: key);

  final DataResult proResult;
  @override
  _ResultContextState createState() => _ResultContextState();
}

class _ResultContextState extends State<ResultContext> {
  //Views
  Widget shownResultText = Container();
  Widget shownResultTitle = Container();

  @override
  Widget build(BuildContext context) {
    shownResultText = widget.proResult.explain;
    shownResultTitle = widget.proResult.title;
    return Scaffold(
        body: centerColumn([
      shownResultTitle,
      const SizedBox(height: 6),
      views(shownResultText, context, 400),
      const SizedBox(height: 8),
      DarkerButton(
          text: '그래프로 보기',
          onPressed: () {
            globalTabController?.index = 1;
          },
          iconDetail:
              const Icon(Icons.arrow_right_alt, size: 50, color: Colors.white)),
      buttons(context),
    ]));
  }
}

Widget buttons(context) {
  return Column(
    children: [
      const SizedBox(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          DarkButton(
              text: "업적",
              onPressed: () {
                Navigator.pushNamed(context, '/achievement');
              },
              width: 180,
              height: 70),
          const Spacer(flex: 1),
          DarkButton(
              text: "공유하기",
              onPressed: () {},
              width: 180,
              height: 70,
              icon: Icons.share),
          const SizedBox(width: 20),
        ],
      ),
      const SizedBox(height: 5),
      DarkButton(
          text: "처음으로",
          onPressed: () {
            Navigator.pop(context);
          })
    ],
  );
}
