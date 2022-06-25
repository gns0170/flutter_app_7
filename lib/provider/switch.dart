import 'package:flutter/material.dart';
import 'package:flutter_application_7/iap/logic/firebase_notifier.dart';

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
  PopUpStatus _achievementAlarm = PopUpStatus.off;
  PopUpStatus get achievementAlarm => _achievementAlarm;

  void adPurchaseOnOff() {
    _adPurchase =
        _adPurchase == PopUpStatus.on ? PopUpStatus.off : PopUpStatus.on;
    notifyListeners();
  }

  void achievementAlarmOnOff() {
    _achievementAlarm =
        _achievementAlarm == PopUpStatus.on ? PopUpStatus.off : PopUpStatus.on;
    notifyListeners();
  }
}

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
