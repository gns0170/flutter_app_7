import 'package:flutter/material.dart';
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
      home: const Home(),
    );
  }
}
