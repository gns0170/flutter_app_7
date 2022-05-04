import 'package:flutter/material.dart';
import '../widgets/layout.dart';
import '../widgets/button.dart';
import '../widgets/adver.dart';
import '../widgets/texts.dart' as custom_text;

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

int switchAd = 0;

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    myBanner.load();
    //views
    return Scaffold(
      body: centerColumn([
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
            Navigator.pushNamed(context, '/question');
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
        Text("$switchAd"),
        DarkButton(
          text: "나는 롤을 모른다!",
          height: 50,
          onPressed: () {
            switchAd = (switchAd + 1) % 2;

            // Navigator.pushNamed(context, '/achievement');
          },
          icon: Icons.reply,
        ),
        const SizedBox(
          height: 10,
        ),
        switchAd == 0
            ? adContainer
            : const SizedBox(
                height: 10,
              ),
      ]),
    );
  }
}
