import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/functions/iap/logic/dash_purchases.dart';
import 'package:flutter_application_7/back/functions/select_correct_result/check_weight.dart';
import 'package:flutter_application_7/front/pages/result/result.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';
import 'package:flutter_application_7/front/widgets/parts/button.dart';
import 'package:flutter_application_7/front/widgets/parts/layout.dart';
import 'package:flutter_application_7/front/widgets/parts/view.dart';

import 'package:provider/provider.dart';

import 'package:share_plus/share_plus.dart';

//first Screen
class ResultContext extends StatefulWidget {
  const ResultContext({Key? key}) : super(key: key);

  @override
  _ResultContextState createState() => _ResultContextState();
}

class _ResultContextState extends State<ResultContext> {
  //TODO: 이름, 구조 정리하고 기능 따로 빼기.
  //TODO: 에러 발생, Another exception was thrown: setState() or markNeedsBuild() called during build.
  // 구조적 문제로 추정
  @override
  Widget build(BuildContext context) {
    var purchase = context.read<DashPurchases>();
    var checkWeight = context.read<CheckWeight>();
    var result = checkWeight.getResult();

    return Scaffold(
        body: centerColumn([
      purchase.adUpgrade == false
          ? const Spacer(flex: 2)
          : const Spacer(flex: 1),
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

dynamic shareResult() {
  return Share.share("example\nhttps://example.com");
}

//버튼 모음
class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerNavigation = context.watch<ProviderNavigation>();
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
                  providerNavigation.achievementOnOff();
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
              providerNavigation.changePage(MainPage.home);
            }),
      ],
    );
  }
}
