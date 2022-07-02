import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';
import 'package:flutter_application_7/front/provider/navigation.dart';

import 'package:provider/provider.dart';

import '../widgets/parts/layout.dart';
import '../widgets/parts/button.dart';

import '../widgets/parts/texts.dart' as custom_text;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

//global dataProcess
List<int> globalWeight = [0, 0, 0, 0];
void proAddWeight(List<int> a) {
  if (a.length == 4) {
    for (int index = 0; index < 4; index++) {
      globalWeight[index] = globalWeight[index] + a[index];
    }
  }
}

List<int> globalWeightPosition = [0, 0, 0, 0, 0];
void proAddWeightPosition(List<int> a) {
  if (a.length == 5) {
    for (int index = 0; index < 5; index++) {
      globalWeightPosition[index] = globalWeightPosition[index] + a[index];
    }
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var firebaseNotifier = context.watch<FirebaseNotifier>();
    var providerNavigation = context.watch<ProviderNavigation>();

    if (firebaseNotifier.isLoggingIn) {
      firebaseNotifier.login();
    }

    //views
    return centerColumn([
      const Spacer(flex: 3),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: custom_text.TextQuestion(words: '당신에게 가장 어울리는 포지션은?'),
      ),
      const SizedBox(
        height: 20,
      ),
      DarkButton(
        onPressed: () {
          providerNavigation.changePage(MainPage.question);
          //성향, 포지션 점수 초기화
          globalWeight = [0, 0, 0, 0];
          globalWeightPosition = [0, 0, 0, 0, 0];
        },
        text: "시작!",
        width: 115,
        height: 63,
        fontStyle: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(flex: 3),
      DarkButton(
        text: "나는 롤을 모른다!",
        height: 50,
        onPressed: () {
          setState(() {
            firebaseNotifier.login();
          });
        },
        icon: Icons.reply,
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
