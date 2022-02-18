import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/questions.dart';
import 'package:flutter_application_7/screens/result.dart';
import 'package:flutter_application_7/widgets/appbar.dart';
import './screens/home.dart';
import './values/colors.dart' as custom_colors;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: custom_colors.primaryColor1,
            actionsIconTheme: IconThemeData(
              color: Colors.white,
              size: 32,
            )),
      ),
      home: Scaffold(
        appBar: baseAppBar,
        body: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            '/question': (context) => const Question(),
            '/result': (context) => const Result(),
          },
        ),
      ),
    );
  }
}
