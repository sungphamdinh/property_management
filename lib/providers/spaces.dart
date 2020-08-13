import 'package:flutter/foundation.dart';

class Space {
  final String id;
  final String title;
  final String address;
  final List<String> imageUrls;
  final double price;
  Space({this.id, this.title, this.address, this.imageUrls, this.price});
}

class Properties with ChangeNotifier {
  List<Space> spaces = [];
  List<Space> get properties => [...spaces];

  Future<void> createNewSpace(Map<String, dynamic> json) async {}
}
