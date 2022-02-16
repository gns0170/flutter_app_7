import 'package:flutter/material.dart';
import '../widgets/layout.dart';
import '../widgets/texts.dart';
import '../widgets/button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('레이아웃 테스트 입니다.'),
      ),
      body: centerColumn([
        testText('234', context),
        const DarkButton(
          text: "시작",
          icon: Icons.reply,
        ),
      ]),
    );
  }
}
