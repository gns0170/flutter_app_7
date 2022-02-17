import 'package:flutter/material.dart';
import '../widgets/layout.dart';
import '../widgets/button.dart';
import '../widgets/texts.dart' as custom_text;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
          icon: Icons.reply,
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
