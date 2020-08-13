import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/room.dart';

class Property {
  final String id;
  final String title;
  final String address;
  final List<String> imageUrls;
  final double price;
  Property({this.id, this.title, this.address, this.imageUrls, this.price});
}

class Properties with ChangeNotifier {
  List<Property> _properties = [
    Property(
        id: 'id1',
        title: 'Kí túc xá/Homestay Sleepbox có cửa riêng biệt Bình Lợi, BT',
        address: '232/5/2 Bình Lợi, Phường 13, Quận Bình Thạnh, Hồ Chí Minh',
        imageUrls: [
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994159323_FB_IMG_1579399674241.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994179116_FB_IMG_1579399680939.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994195341_FB_IMG_1579399690001.jpg'
        ],
        price: 1700000),
    Property(
        id: 'id2',
        title: 'Kí túc xá/Homestay Sleepbox có cửa riêng biệt Bình Lợi, BT',
        address: '232/5/2 Bình Lợi, Phường 13, Quận Bình Thạnh, Hồ Chí Minh',
        imageUrls: [
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994159323_FB_IMG_1579399674241.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994179116_FB_IMG_1579399680939.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994195341_FB_IMG_1579399690001.jpg'
        ],
        price: 1700000),
    Property(
        id: 'id3',
        title: 'Kí túc xá/Homestay Sleepbox có cửa riêng biệt Bình Lợi, BT',
        address: '232/5/2 Bình Lợi, Phường 13, Quận Bình Thạnh, Hồ Chí Minh',
        imageUrls: [
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994159323_FB_IMG_1579399674241.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994179116_FB_IMG_1579399680939.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994195341_FB_IMG_1579399690001.jpg'
        ],
        price: 1700000),
    Property(
        id: 'id4',
        title: 'Kí túc xá/Homestay Sleepbox có cửa riêng biệt Bình Lợi, BT',
        address: '232/5/2 Bình Lợi, Phường 13, Quận Bình Thạnh, Hồ Chí Minh',
        imageUrls: [
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994159323_FB_IMG_1579399674241.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994179116_FB_IMG_1579399680939.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994195341_FB_IMG_1579399690001.jpg'
        ],
        price: 1700000),
    Property(
        id: 'id5',
        title: 'Kí túc xá/Homestay Sleepbox có cửa riêng biệt Bình Lợi, BT',
        address: '232/5/2 Bình Lợi, Phường 13, Quận Bình Thạnh, Hồ Chí Minh',
        imageUrls: [
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994159323_FB_IMG_1579399674241.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994179116_FB_IMG_1579399680939.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994195341_FB_IMG_1579399690001.jpg'
        ],
        price: 1700000),
    Property(
        id: 'id6',
        title: 'Kí túc xá/Homestay Sleepbox có cửa riêng biệt Bình Lợi, BT',
        address: '232/5/2 Bình Lợi, Phường 13, Quận Bình Thạnh, Hồ Chí Minh',
        imageUrls: [
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994159323_FB_IMG_1579399674241.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994179116_FB_IMG_1579399680939.jpg',
          'https://bayleaf.s3.amazonaws.com/property-images%2F1595994195341_FB_IMG_1579399690001.jpg'
        ],
        price: 1700000)
  ];
  List<Property> get properties => [..._properties];

  Future<void> addProperty(Map<String, dynamic> json) async {
    json['roomType'] = 'roomForRent';
    final docRef = await Firestore.instance.collection('properties').add(json);
    final propertyDoc = await docRef.get();
    Room property = Room.fromJson(propertyDoc.data);
    property.id = docRef.documentID;
    print(property.toJson());
  }
}
