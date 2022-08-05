import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/widgets/mainpage/widgets/home/index.dart';
import 'package:flutter_application_7/front/mainpage/common/button.dart';
import 'package:flutter_application_7/front/mainpage/common/layout.dart';
import 'package:provider/provider.dart';
import '../common/texts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    var homeBack = context.read<HomeBack>();
    homeBack.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeBack = context.watch<HomeBack>();
    //views
    return centerColumn([
      const Spacer(flex: 3),
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: TextQuestion(words: '당신에게 가장 어울리는 포지션은?')),
      const SizedBox(height: 20),
      DarkButton(
        text: "시작!",
        width: 115,
        height: 63,
        fontStyle: const TextStyle(
            color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        onPressed: () {
          homeBack.goToQuestion();
        },
      ),
      const Spacer(flex: 3),
      DarkButton(
          text: "나는 롤을 모른다!",
          height: 50,
          onPressed: () {
            // setState(() {
            //   firebaseNotifier.login();
            // });
            // //local storage init
            // initLocalRecord();
          },
          icon: Icons.reply),
      const SizedBox(height: 10),
    ]);
  }
}
