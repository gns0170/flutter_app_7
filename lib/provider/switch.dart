import 'package:flutter/material.dart';
import 'package:flutter_application_7/iap/logic/firebase_notifier.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';

final drawerSwitch = DrawerSwitch();
final appBarSwitch = AppBarSwitch();

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

// class HomeSwitch extends ChangeNotifier {
//   bool _switchAd = true;
//   bool get switchAd => _switchAd;

//   void changeSwitchAd() {
//     _switchAd = !_switchAd;
//     notifyListeners();
//   }

//   void noAd() {
//     _switchAd = false;
//     notifyListeners();
//   }

//   void notify() {
//     notifyListeners();
//   }
// }

class ProviderSwitches extends ChangeNotifier {
  bool _ad = true;
  bool get ad => _ad;
  FirebaseNotifier firebaseNotifier;

  ProviderSwitches(this.firebaseNotifier);
  void changeAd() {
    _ad = !_ad;
    notifyListeners();
  }

  void noAd() {
    _ad = false;
    notifyListeners();
  }
}
