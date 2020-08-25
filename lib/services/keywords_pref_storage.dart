import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/keywords_repository.dart';

class KeywordsPrefStorage implements KeywordsRepository {
  static const KEYWORDS_KEY = "KEYWORDS_KEY";

  @override
  Future<void> addKeyword(String keyword) async {
    final prefs = await SharedPreferences.getInstance();
    final isNotExist = _isNotExistKeyword(prefs, keyword);

    if (isNotExist && _isNotExceedLimit(prefs)) {
      List<String> editedKeywords = prefs.getStringList(KEYWORDS_KEY) ?? [];
      editedKeywords.add(keyword);
      await prefs.setStringList(KEYWORDS_KEY, [...editedKeywords]);
    }
  }

  @override
  Future<List<String>> getKeywords() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(KEYWORDS_KEY) ?? [];
  }

  @override
  Future<void> removeKeyword(String keyword) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> editedKeywords = prefs.getStringList(KEYWORDS_KEY) ?? [];
    editedKeywords.remove(keyword);
    await prefs.setStringList(KEYWORDS_KEY, [...editedKeywords]);
  }

  bool _isNotExistKeyword(SharedPreferences pref, String keyword) {
    final data = pref.getStringList(KEYWORDS_KEY) ?? [];
    return !data.contains(keyword);
  }

  bool _isNotExceedLimit(SharedPreferences pref) {
    final data = pref.getStringList(KEYWORDS_KEY) ?? [];
    return data.length <= 5;
  }
}
