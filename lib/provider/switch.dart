import 'package:flutter/material.dart';
import 'package:flutter_application_7/iap/logic/firebase_notifier.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';

final appBarSwitch = AppBarSwitch();

enum PageStatus { on, off }

class ProviderNavigation extends ChangeNotifier {
  PageStatus _statistic = PageStatus.off;
  PageStatus _achievement = PageStatus.off;

  PageStatus get statistic => _statistic;
  PageStatus get achievement => _achievement;

  void statisticOnOff() {
    _statistic = _statistic == PageStatus.on ? PageStatus.off : PageStatus.on;
    notifyListeners();
  }

  void achievementOnOff() {
    _achievement =
        _achievement == PageStatus.on ? PageStatus.off : PageStatus.on;
    notifyListeners();
  }
}

enum PopUpStatus { on, off }

class ProviderPopup extends ChangeNotifier {
  PopUpStatus _adPurchase = PopUpStatus.off;
  PopUpStatus get adPurchase => _adPurchase;

  PopUpStatus _ad
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

class ProviderUpgrade extends ChangeNotifier {
  bool _ad = true;
  bool get ad => _ad;
  FirebaseNotifier firebaseNotifier;

  ProviderUpgrade(this.firebaseNotifier);
  void changeAd() {
    _ad = !_ad;
    notifyListeners();
  }

  void noAd() {
    _ad = false;
    notifyListeners();
  }
}
