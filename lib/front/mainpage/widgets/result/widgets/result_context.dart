import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/result/index.dart';
import 'package:flutter_application_7/front/mainpage/common/button.dart';
import 'package:flutter_application_7/front/mainpage/common/layout.dart';
import 'package:flutter_application_7/front/mainpage/common/view.dart';
import '../common/button.dart';
import '../common/spacer.dart';
import '../index.dart';
import 'package:provider/provider.dart';

//first Screen
class ResultContext extends StatefulWidget {
  const ResultContext({Key? key}) : super(key: key);

  @override
  _ResultContextState createState() => _ResultContextState();
}

class _ResultContextState extends State<ResultContext> {
  @override
  Widget build(BuildContext context) {
    var resultBack = context.watch<ResultBack>();
    var result = resultBack.result;

    return Scaffold(
        body: centerColumn([
      const SpacerResult(number: 0),
      result.title,
      const SizedBox(height: 6),
      views(result.explain, context, 350),
      const SizedBox(height: 8),
      DarkerButton(
          text: '그래프로 보기',
          onPressed: () {
            globalTabController?.index = 1;
          },
          iconDetail:
              const Icon(Icons.arrow_right_alt, size: 50, color: Colors.white)),
      const Buttons(),
      const Spacer(flex: 1),
      const SizedBox(
        height: 10,
      )
    ]));
  }
}
