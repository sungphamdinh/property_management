import 'dart:async';
import '../models/space.dart';

abstract class SpacesRepository {
  Future<List<Space>> getSpaces();
  Future<Space> createNewSpace(Map<String, dynamic> json);
}
