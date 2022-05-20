import 'package:flutter/material.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';
import 'package:flutter_application_7/widgets/achievement_popup/achievemen_show.dart';

import 'package:flutter_provider/flutter_provider.dart';

class BaseAppBar extends StatefulWidget with PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  _BaseAppBarState createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
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
      });
    });
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            shownAchieve(context, null, null, null);
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
