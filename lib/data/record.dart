import 'package:flutter_application_7/data/achievements.dart';
import 'package:flutter_application_7/data/results.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<int> recordR = [];
late List<int> recordA = [];

class Record {
  //Data Process
  late List<String> stringRecordR = [];
  late List<String> stringRecordA = [];

  void initRecord() {
    if (recordR.length != r.length) {
      for (int i = 0; i < r.length; i++) {
        recordR.add(0);
        stringRecordR.add('0');
      }
    }
    if (recordA.length != a.length) {
      for (int i = 0; i < a.length; i++) {
        recordA.add(0);
        stringRecordA.add('0');
      }
    }
  }

  void convertStringToInt() {
    for (int i = 0; i < r.length; i++) {
      recordR[i] = int.parse(stringRecordR[i]);
    }
    for (int i = 0; i < a.length; i++) {
      recordA[i] = int.parse(stringRecordA[i]);
    }
  }

  void convertIntToString() {
    for (int i = 0; i < r.length; i++) {
      stringRecordR[i] = recordR[i].toString();
    }
    for (int i = 0; i < a.length; i++) {
      stringRecordA[i] = recordA[i].toString();
    }
  }

  Future<void> loadRecord() async {
    final prefs = await SharedPreferences.getInstance();
    initRecord();
    stringRecordR = prefs.getStringList('recordR') ?? stringRecordR;
    stringRecordA = prefs.getStringList('recordA') ?? stringRecordA;

    convertStringToInt();
  }

  Future<void> saveRecord() async {
    convertIntToString();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recordR', stringRecordR);
    await prefs.setStringList('recordA', stringRecordA);
  }
}
