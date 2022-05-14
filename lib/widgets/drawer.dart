import 'package:flutter/material.dart';

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
          title: const Text('12'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Statistics'),
          onTap: () {
            drawerSwitch1.change();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

bool drawerSwitch = false;
final drawerSwitch1 = DrawerSwitch();

class DrawerSwitch extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;
  void change() {
    _value = !_value;
    notifyListeners();
  }
}
