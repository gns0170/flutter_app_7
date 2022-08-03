import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/connection/firebase/firebase_notifier.dart';

class ProviderUpgrade extends ChangeNotifier {
  bool _ad = true;
  bool get ad => _ad;
  FirebaseNotifier firebaseNotifier;

  ProviderUpgrade(this.firebaseNotifier);

  void noAd() {
    _ad = false;
    notifyListeners();
  }
}
