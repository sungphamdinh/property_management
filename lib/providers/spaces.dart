import 'package:flutter/foundation.dart';
import 'package:property_management/data/data.dart';
import 'package:property_management/locator.dart';
import 'package:property_management/providers/base_provider.dart';
import '../models/space.dart';

class Spaces extends BaseProvider {
  final _spaceRepository = getIt.get<SpacesFirebaseStorage>();

  List<Space> _spaces = [];
  List<Space> _searchResults = [];

  List<Space> get spaces => [..._spaces];
  List<Space> get searchResults => [..._searchResults];

  Future<void> getPlaces() async {
    setState(ProviderState.Busy);
    _spaces = await _spaceRepository.getSpaces();
    setState(ProviderState.Idle);
  }

  Future<void> createNewSpace(Map<String, dynamic> json) async {
    final space = await this._spaceRepository.createNewSpace(json);
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
