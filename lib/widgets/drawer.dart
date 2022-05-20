import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';

import 'package:flutter_application_7/screens/statistics.dart';

class BaseDrawer extends StatefulWidget {
  const BaseDrawer({Key? key}) : super(key: key);
  @override
  BaseDrawerState createState() => BaseDrawerState();
}

class BaseDrawerState extends State<BaseDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 80),
      children: [
        ListTile(
          title: const Text('업적'),
          onTap: () {
            //drawerSwitch.changeAchievement();
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Achievement()));
          },
        ),
        ListTile(
          title: const Text('통계'),
          onTap: () {
            //drawerSwitch.changeStatistics();
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Statistics()));
          },
        ),
      ],
    );
  }
}
