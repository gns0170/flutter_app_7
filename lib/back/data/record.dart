import 'package:flutter_application_7/back/data/achievements.dart';
import 'package:flutter_application_7/back/data/results.dart';
import 'package:flutter_application_7/back/data/statistics.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<int> recordR = [];
late List<int> recordA = [];
late List<int> recordS = [];

class Record {
  //Data Process
  late List<String> stringRecordR = [];
  late List<String> stringRecordA = [];
  late List<String> stringRecordS = [];

  void initRecord() {
    if (recordR.length != r.length) {
      for (int i = 0; i < r.length; i++) {
        recordR.add(0);
        stringRecordR.add('0');
      }
    }
    if (recordA.length != a.length - 2) {
      for (int i = 0; i < a.length - 2; i++) {
        recordA.add(0);
        stringRecordA.add('0');
      }
    }
    if (recordS.length != s.length - 2) {
      for (int i = 0; i < s.length; i++) {
        recordS.add(0);
        stringRecordS.add('0');
      }
    }
  }

  void convertStringToInt() {
    if (a.length != stringRecordA.length) {
      if (a.length > stringRecordA.length) {
        for (int i = 0; i < a.length - stringRecordA.length + 1; i++) {
          stringRecordA.add('0');
        }
      } else {
        for (int i = 0; i < stringRecordA.length - a.length + 1; i++) {
          stringRecordA.removeLast();
        }
      }
    }
    for (int i = 0; i < recordR.length; i++) {
      recordR[i] = int.parse(stringRecordR[i]);
    }
    for (int i = 0; i < recordA.length; i++) {
      recordA[i] = int.parse(stringRecordA[i]);
    }
    for (int i = 0; i < recordS.length; i++) {
      recordS[i] = int.parse(stringRecordS[i]);
    }
  }

  void convertIntToString() {
    for (int i = 0; i < recordR.length; i++) {
      stringRecordR[i] = recordR[i].toString();
    }
    for (int i = 0; i < recordA.length; i++) {
      stringRecordA[i] = recordA[i].toString();
    }
    for (int i = 0; i < recordS.length; i++) {
      stringRecordS[i] = recordS[i].toString();
    }
  }

  Future<void> loadRecord() async {
    final prefs = await SharedPreferences.getInstance();
    initRecord();
    stringRecordR = prefs.getStringList('recordR') ?? stringRecordR;
    stringRecordA = prefs.getStringList('recordA') ?? stringRecordA;
    stringRecordS = prefs.getStringList('recordS') ?? stringRecordS;

    convertStringToInt();
  }

  Future<void> saveRecord() async {
    convertIntToString();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recordR', stringRecordR);
    await prefs.setStringList('recordA', stringRecordA);
    await prefs.setStringList('recordS', stringRecordS);
  }
}
