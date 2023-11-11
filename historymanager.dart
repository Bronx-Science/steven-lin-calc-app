import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'historyrecord.dart';

Future<void> saveHistory(HistoryRecord record) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('history') ?? [];
    history.add(json.encode(record.toJson()));
    await prefs.setStringList('history', history);
  } catch (e) {
    // Handle any errors here
    print('Error saving history: $e');
  }
}


Future<List<HistoryRecord>> loadHistory() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('history') ?? [];
    return history.map((record) => HistoryRecord.fromJson(json.decode(record))).toList();
  } catch (e) {
    // Handle any errors here
    print('Error loading history: $e');
    return [];
  }
}
