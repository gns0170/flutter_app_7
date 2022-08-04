import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/data/achievements/achievements.dart';
import 'package:flutter_application_7/back/functions/achievement_record.dart';
import 'package:flutter_application_7/front/common/layout.dart';
import 'package:flutter_application_7/front/provider/values/colors.dart'
    as custom_colors;
import 'package:provider/provider.dart';

//ListView
class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    var recordAchievement = context.watch<RecordAchievement>();

    //간략화
    List<int> recordA = recordAchievement.recordA;

    //Views
    return Scaffold(
        appBar: AppBar(),
        body: centerColumn([
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              //height: MediaQuery.of(context).size.height - 80,
              child: ListView.builder(
                itemCount: a.length,
                itemBuilder: (BuildContext context, int index) {
                  int proPNumber = a[index].pNumber;
                  String proTitle = a[index].title;
                  String proText = a[index].text;
                  dynamic proIcon = a[index].icon;

                  if (recordA[a[index].pNumber] == 0 && proIcon != "Bar") {
                    proIcon = iconBasicA;
                  }
                  AchieveTile proAchieve = AchieveTile(
                      popUpAchieve: DataAchievement(
                          proPNumber, proTitle, proText, proIcon,
                          cases: recordA[a[index].pNumber]),
                      semiActive:
                          recordA[a[index].pNumber] != 0 ? true : false);
                  return proAchieve;
                },
              ),
            ),
          )
        ]));
  }
}

//Tile
class AchieveTile extends StatefulWidget {
  const AchieveTile(
      {Key? key, required this.popUpAchieve, required this.semiActive})
      : super(key: key);
  final DataAchievement popUpAchieve;
  final bool semiActive;
  @override
  _AchieveTileState createState() => _AchieveTileState();
}

class _AchieveTileState extends State<AchieveTile> {
  @override
  Widget build(BuildContext context) {
    //views
    if (widget.popUpAchieve.icon == "Bar") {
      return Column(children: [
        const SizedBox(height: 10),
        Material(
            type: MaterialType.transparency,
            child: Text(widget.popUpAchieve.title,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
        const SizedBox(height: 10),
      ]);
    } else {
      return Card(
          borderOnForeground: true,
          color: widget.semiActive == true
              ? custom_colors.primaryColor4
              : custom_colors.primaryColor1,
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 90,
              child: Row(children: [
                const SizedBox(width: 8),
                Card(
                  child: Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(width: 2, color: Colors.black54)),
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    child: widget.popUpAchieve.icon,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: widget.semiActive == true
                              ? Colors.white24
                              : Colors.black12,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.popUpAchieve.title,
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(widget.popUpAchieve.text,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white)),
                          const SizedBox(height: 6)
                        ],
                      )),
                )
              ])));
    }
  }
}
