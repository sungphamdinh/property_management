import 'package:flutter/foundation.dart';
import 'package:property_management/data/keywords_pref_storage.dart';
import 'package:property_management/locator.dart';

class HistoryKeywords with ChangeNotifier {
  final _repository = getIt.get<KeywordsPrefStorage>();

  List<String> _keywords = [];
  List<String> get keywords => [..._keywords];

  Future<void> getKeywords() async {
    _keywords = await this._repository.getKeywords();
    notifyListeners();
  }

  Future<void> addKeyword(String keyword) async {
    await this._repository.addKeyword(keyword);
    _keywords.add(keyword);
    notifyListeners();
  }

  Future<void> removeKeyword(String keyword) async {
    await this._repository.removeKeyword(keyword);
    _keywords.remove(keyword);
    notifyListeners();
  }
}
