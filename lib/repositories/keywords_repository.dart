import 'dart:async';

abstract class KeywordsRepository {
  Future<List<String>> getKeywords();
  Future<void> addKeyword(String keyword);
  Future<void> removeKeyword(String keyword);
}
