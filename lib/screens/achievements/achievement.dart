import 'package:flutter/material.dart';

import '../../widgets/layout.dart';

//List
class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  _AchievementState createState() => _AchievementState();
}

dynamic globalTabController;

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return centerColumn([
      Card(
          child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 90,
              child: Row(children: [
                const SizedBox(width: 8),
                Card(
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    child: const Text('?',
                        style: TextStyle(fontSize: 40, color: Colors.black87)),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                    width: 280,
                    color: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Colors.blueAccent,
                            child: Text('꿈을 위하여에베베베',
                                style: TextStyle(fontSize: 26))),
                        SizedBox(height: 5),
                        Text('놀라운 비밀을 찾아서', style: TextStyle(fontSize: 18))
                      ],
                    )),
              ])))
    ]);
  }
}
