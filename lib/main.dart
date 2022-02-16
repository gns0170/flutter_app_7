import 'package:flutter/material.dart';
import './widgets/layout.dart';
import './widgets/texts.dart';
import 'widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A',
      theme: ThemeData(),
      home: const Home(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

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
