import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> saveLocalRecord(List<int> record, String name) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(name, encode(record));
}

Future<Object> loadLocalRecord(String name) async {
  final prefs = await SharedPreferences.getInstance();
  dynamic _values = prefs.getString(name);
  if (_values is String) {
    return decode(_values);
  } else {
    return Error();
  }
}

String encode(List<int> record) => json.encode(record);
List<int> decode(String record) => json.decode(record) as List<int>;
