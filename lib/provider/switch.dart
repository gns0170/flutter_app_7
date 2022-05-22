import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';

final drawerSwitch = DrawerSwitch();
final appBarSwitch = AppBarSwitch();
final homeSwitch = HomeSwitch();

class DrawerSwitch extends ChangeNotifier {
  bool _valueStatistic = false;
  bool _valueAchievement = false;
  bool get valueStatistic => _valueStatistic;
  bool get valueAchievement => _valueAchievement;
  void changeStatistics() {
    _valueStatistic = !_valueStatistic;
    notifyListeners();
  }

  void changeAchievement() {
    _valueAchievement = !_valueAchievement;
    notifyListeners();
  }

  void test(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Achievement()));
  }

  void notify() {
    notifyListeners();
  }
}

class AppBarSwitch extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;

  bool _valueAdPopup = false;
  bool get valueAdPopup => _valueAdPopup;

  void changeShownAchieve() {
    _value = !_value;
    notifyListeners();
  }

  void changeValueAdPopup() {
    _valueAdPopup = !_valueAdPopup;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}

class HomeSwitch extends ChangeNotifier {
  bool _switchAd = false;
  bool get switchAd => _switchAd;

  void changeSwitchAd() {
    _switchAd = !_switchAd;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}
