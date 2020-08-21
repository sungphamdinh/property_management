import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryKeywords with ChangeNotifier {
  static const key = "keywords";

  List<String> _keywords = [];
  List<String> get keywords => [..._keywords];

  Future<List<String>> getKeywords() async {
    final prefs = await SharedPreferences.getInstance();
    final storageKeywords = prefs.getStringList(key);
    if (storageKeywords != null) {
      _keywords = storageKeywords;
    }
    return _keywords;
  }

  Future<void> addKeyword(String keyword) async {
    final prefs = await SharedPreferences.getInstance();
    final isExist = _isExistKeyword(keyword);

    if (!isExist && _isNotExceedLimit(prefs)) {
      _keywords.add(keyword);
      await prefs.setStringList(key, [..._keywords]);
      notifyListeners();
    }
  }

  Future<void> removeKeyword(String keyword) async {
    final prefs = await SharedPreferences.getInstance();

    _keywords.remove(keyword);
    await prefs.setStringList(key, [..._keywords]);

    notifyListeners();
  }

  bool _isExistKeyword(String keyword) {
    return _keywords.contains(keyword);
  }

  bool _isNotExceedLimit(SharedPreferences prefs) {
    return _keywords.length <= 5;
  }
}
