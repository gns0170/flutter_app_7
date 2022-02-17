import 'package:flutter/material.dart';
import '../widgets/layout.dart';
import '../widgets/button.dart';
import '../values/colors.dart' as custom_color;
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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 30,
            icon: const Icon(Icons.share),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {},
              splashRadius: 30,
              icon: const Icon(Icons.format_list_bulleted)),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: centerColumn([
        const Spacer(flex: 3),
        const custom_text.TestQuestion(words: '123'),
        const SizedBox(
          height: 10,
        ),
        DarkButton(
          onPressed: () {},
          text: "시작!",
          width: 115,
          height: 60,
        ),
        const Spacer(flex: 3),
        const DarkButton(
          text: "나는 롤을 모른다!",
          height: 50,
          fontStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          icon: Icon(Icons.reply),
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
