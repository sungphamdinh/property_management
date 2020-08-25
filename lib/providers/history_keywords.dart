import 'package:flutter/foundation.dart';
import 'package:property_management/repositories/keywords_repository.dart';

class HistoryKeywords with ChangeNotifier {
  final KeywordsRepository repository;

  List<String> _keywords = [];
  List<String> get keywords => [..._keywords];

  HistoryKeywords({@required this.repository});

  Future<void> getKeywords() async {
    _keywords = await this.repository.getKeywords();
    notifyListeners();
  }

  Future<void> addKeyword(String keyword) async {
    await this.repository.addKeyword(keyword);
    _keywords.add(keyword);
    notifyListeners();
  }

  Future<void> removeKeyword(String keyword) async {
    await this.repository.removeKeyword(keyword);
    _keywords.remove(keyword);
    notifyListeners();
  }
}
