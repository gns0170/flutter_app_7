import 'package:flutter/material.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';

import 'package:flutter_application_7/screens/statistics.dart';

class BaseDrawer extends StatefulWidget {
  const BaseDrawer({Key? key}) : super(key: key);
  @override
  BaseDrawerState createState() => BaseDrawerState();
}

class BaseDrawerState extends State<BaseDrawer> {
  TextStyle drawerfont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 80),
      children: [
        ListTile(
          title: Text('업적', style: drawerfont),
          onTap: () {
            //drawerSwitch.changeAchievement();
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Achievement()));
          },
        ),
        const Divider(color: Colors.black),
        ListTile(
          title: Text('통계', style: drawerfont),
          onTap: () {
            //drawerSwitch.changeStatistics();
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Statistics()));
          },
        ),
        const Divider(color: Colors.black),
        ListTile(
          title: Text('광고 안보기', style: drawerfont),
          onTap: () {
            //drawerSwitch.changeStatistics();
            Navigator.pop(context);
            appBarSwitch.changeValueAdPopup();
          },
        ),
      ],
    );
  }
}
