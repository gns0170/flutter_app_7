import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/achievements.dart';
import 'package:flutter_application_7/data/record.dart';
import '../../values/colors.dart' as custom_colors;
import '../../widgets/layout.dart';

//ListView
class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);
  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  //dataProcess
  List<DataAchievement> listShownAchieve = a;

  @override
  Widget build(BuildContext context) {
    //dataProcess
    setAchievementCasesByRecord();
    //Views
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
              if (index > 8) {
                proTitle = "???";
                proText = "?????";
              }
            }
            AchieveTile proAchieve = AchieveTile(
                shownAchieve: DataAchievement(proTitle, proText, proIcon,
                    cases: recordA[index]),
                semiActive: recordA[index] != 0 ? true : false);
            return proAchieve;
          },
        ),
      ),
    ]);
  }
}

//Tile
class AchieveTile extends StatefulWidget {
  const AchieveTile(
      {Key? key, required this.shownAchieve, required this.semiActive})
      : super(key: key);
  final DataAchievement shownAchieve;
  final bool semiActive;
  @override
  _AchieveTileState createState() => _AchieveTileState();
}

class _AchieveTileState extends State<AchieveTile> {
  @override
  Widget build(BuildContext context) {
    //views
    if (widget.shownAchieve.icon == "Bar") {
      return Column(children: [
        const SizedBox(height: 10),
        Material(
            type: MaterialType.transparency,
            child: Text(widget.shownAchieve.title,
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
                    child: widget.shownAchieve.icon,
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
                          Text(widget.shownAchieve.title,
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(widget.shownAchieve.text,
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.white))
                        ],
                      )),
                )
              ])));
    }
  }
}
