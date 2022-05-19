import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/results.dart';

import 'package:flutter_application_7/widgets/button.dart';
import 'package:flutter_application_7/widgets/drawer.dart';
import 'package:flutter_application_7/widgets/layout.dart';
import 'package:flutter_application_7/widgets/view.dart';
import 'package:share_plus/share_plus.dart';
import '../../values/colors.dart' as custom_colors;
import 'package:achievement_view/achievement_view.dart';

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
      views(shownResultText, context, 350),
      const SizedBox(height: 8),
      DarkerButton(
          text: '그래프로 보기',
          onPressed: () {
            //globalTabController?.index = 1;
            showAchievementView(context);
          },
          iconDetail:
              const Icon(Icons.arrow_right_alt, size: 50, color: Colors.white)),
      buttons(context),
    ]));
  }
}

dynamic shareResult() {
  return Share.share("example\nhttps://example.com");
}

//버튼 모음
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
                drawerSwitch.changeAchievement();
              },
              width: (MediaQuery.of(context).size.width - 50) / 2,
              height: 70),
          const SizedBox(width: 10),
          DarkButton(
              text: "공유하기",
              onPressed: () => shareResult(),
              width: (MediaQuery.of(context).size.width - 50) / 2,
              height: 70,
              icon: Icons.share),
          const SizedBox(width: 20),
        ],
      ),
      const SizedBox(height: 5),
      DarkButton(
          text: "맨 처음으로",
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
  );
}

void showAchievementView(BuildContext context) {
  dynamic a1 = AchievementView(context,
      title: "텍스트 제목               ",
      subTitle: "텍스트 바디",
      color: custom_colors.primaryColor4.withOpacity(0.9),
      isCircle: true, listener: (status) {
    print(status);
  });

  dynamic a2 = AchievementView(context,
      title: "텍스트 제목               ",
      subTitle: "텍스트 바디",
      color: custom_colors.primaryColor4.withOpacity(0.9),
      isCircle: true, listener: (status) {
    print(status);
  });
}
