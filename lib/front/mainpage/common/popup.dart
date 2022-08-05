import 'package:flutter/material.dart';

enum PopUpStatus { on, off }

class ProviderPopup extends ChangeNotifier {
  PopUpStatus _adPurchase = PopUpStatus.off;
  PopUpStatus get adPurchase => _adPurchase;

  PopUpStatus _achievementAlarm = PopUpStatus.off;
  PopUpStatus get achievementAlarm => _achievementAlarm;

  void adPurchaseOnOff() {
    _adPurchase =
        _adPurchase == PopUpStatus.on ? PopUpStatus.off : PopUpStatus.on;
  }

  void achievementAlarmOnOff() {
    _achievementAlarm =
        _achievementAlarm == PopUpStatus.on ? PopUpStatus.off : PopUpStatus.on;
  }
}
