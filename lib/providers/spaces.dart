import 'package:flutter/foundation.dart';
import 'package:property_management/repositories/spaces_repository.dart';
import '../models/space.dart';

class Spaces with ChangeNotifier {
  final SpacesRepository repository;

  List<Space> _spaces = [];
  List<Space> _searchResults = [];

  List<Space> get spaces => [..._spaces];
  List<Space> get searchResults => [..._searchResults];

  Spaces({this.repository});

  Future<void> getPlaces() async {
    _spaces = await repository.getSpaces();
    notifyListeners();
  }

  Future<void> createNewSpace(Map<String, dynamic> json) async {
    final space = await this.repository.createNewSpace(json);
    _spaces.add(space);
    notifyListeners();
  }

  Space spaceWithId(String id) {
    return _spaces.firstWhere((space) => space.id == id);
  }

  void searchByKeyword(String keyTerm) {
    _searchResults = _spaces
        .where((space) =>
            space.postTitle.toLowerCase().contains(keyTerm.toLowerCase()) ||
            space.address.readableAddress
                .toLowerCase()
                .contains(keyTerm.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void clearSearchResult() {
    _searchResults.clear();
    notifyListeners();
  }
}
