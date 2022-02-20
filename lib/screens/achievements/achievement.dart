import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/achievements.dart';
import 'package:flutter_application_7/data/record.dart';
import 'package:flutter_application_7/main.dart';

import '../../widgets/layout.dart';

//List
class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);
  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  List<DataAchievement> listShownAchieve = a;

  @override
  Widget build(BuildContext context) {
    setAchievementCasesByRecord();
    return centerColumn([
      SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.height - 80,
        child: ListView.builder(
          itemCount: listShownAchieve.length,
          itemBuilder: (BuildContext context, int index) {
            String proTitle = listShownAchieve[index].title;
            String proText = listShownAchieve[index].text;
            dynamic proIcon = listShownAchieve[index].icon;

            if (recordA[index] == 0 && proIcon != "Bar") {
              proIcon = iconBasicA;
            }
            print(a[index].icon);
            AchieveTile proAchieve = AchieveTile(
                shownAchieve: DataAchievement(proTitle, proText, proIcon,
                    cases: recordA[index]));
            return proAchieve;
          },
        ),
      ),
    ]);
  }
}

//Tile
class AchieveTile extends StatefulWidget {
  AchieveTile({Key? key, required this.shownAchieve}) : super(key: key);
  final DataAchievement shownAchieve;
  @override
  _AchieveTileState createState() => _AchieveTileState();
}

class _AchieveTileState extends State<AchieveTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.shownAchieve.icon == "Bar") {
      return Text(widget.shownAchieve.title,
          style: const TextStyle(fontSize: 30, color: Colors.white));
    } else {
      return Card(
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 90,
              child: Row(children: [
                const SizedBox(width: 8),
                Card(
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    child: widget.shownAchieve.icon,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                      color: Colors.amber,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.shownAchieve.title,
                              style: const TextStyle(fontSize: 26)),
                          const SizedBox(height: 5),
                          Text(widget.shownAchieve.text,
                              style: const TextStyle(fontSize: 18))
                        ],
                      )),
                )
              ])));
    }
  }
}
