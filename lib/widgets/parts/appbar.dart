import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';

import 'package:flutter_application_7/widgets/parts/achievement_popup/achievement_show.dart';
import 'package:flutter_provider/flutter_provider.dart';

class BaseAppBar extends StatefulWidget with PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  _BaseAppBarState createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  //inapp purchase

  @override
  Widget build(BuildContext context) {
    //inapp Purchase

    //Drawer Page Change
    Future.delayed(Duration.zero, () {
      setState(() {
        if (Provider.of<DrawerSwitch>(context).valueAchievement == true) {
          drawerSwitch.changeAchievement();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Achievement()));
        }
        if (Provider.of<AppBarSwitch>(context).value == true) {
          appBarSwitch.changeShownAchieve();
          shownAchieve(context, null, null, null);
        }
        if (Provider.of<AppBarSwitch>(context).valueAdPopup == true) {
          appBarSwitch.changeValueAdPopup();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("광고 없애기", style: TextStyle(fontSize: 18)),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              homeSwitch.changeSwitchAd();
                            },
                            child: const Text('￦500',
                                style: TextStyle(fontSize: 15)))
                      ]),
                ));
              });
        }
      });
    });
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            appBarSwitch.changeValueAdPopup();
          },
          splashRadius: 30,
          icon: const Icon(Icons.share),
        ),
        const SizedBox(
          width: 2,
        ),
        Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                splashRadius: 30,
                icon: const Icon(Icons.format_list_bulleted));
          },
        ),
        const SizedBox(
          width: 17,
        ),
      ],
    );
  }
}
