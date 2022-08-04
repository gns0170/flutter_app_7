import 'package:flutter/material.dart';
import 'package:flutter_application_7/front/mainpage/common/button.dart';
import 'package:flutter_application_7/front/mainpage/navigation.dart';
import 'package:flutter_application_7/front/mainpage/widgets/result/common/share.dart';
import 'package:provider/provider.dart';

//버튼 모음
class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerNavigation = context.watch<MainNavigation>();
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
