import 'package:flutter/cupertino.dart';

import '../models/address.dart';
import '../models/owner.dart';
import '../shared/helper.dart';

enum RoomType { roomForRent, roomForShare, house, apartment }
const RoomTypeMaps = {
  RoomType.roomForRent: 'room_for_rent',
  RoomType.roomForShare: 'room_for_share',
  RoomType.house: 'house',
  RoomType.apartment: 'apartment',
};

class Space {
  final String id;
  final RoomType roomType;
  final int numberOfRooms;
  final int capacity;
  final double roomArea;
  final double price;
  final double deposit;
  final double electricityCost;
  final double waterCost;
  final Address address;
  final Owner owner;
  final String postTitle;
  final String description;
  final bool isSpaceForParking;

  Space(
      {@required this.id,
      this.roomType,
      this.numberOfRooms,
      this.capacity,
      this.roomArea,
      this.price,
      this.deposit,
      this.electricityCost,
      this.waterCost,
      this.isSpaceForParking,
      this.address,
      this.owner,
      this.postTitle,
      this.description});

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
        id: json['id'],
        roomType: Helper.encodeEnum(
            RoomTypeMaps, json['roomType'], RoomType.roomForShare),
        numberOfRooms: json['numberOfRooms'],
        capacity: json['capacity'],
        roomArea: json['roomArea'],
        price: json['price'],
        deposit: json['deposit'],
        electricityCost: json['electricityCost'],
        waterCost: json['waterCost'],
        postTitle: json['postTitle'],
        description: json['description'],
        address: Address.fromJson(json['address']),
        owner: Owner.fromJson(json['owner']));
  }
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'roomType': RoomTypeMaps[this.roomType],
      'numberOfRooms': this.numberOfRooms,
      'capacity': this.capacity,
      'roomArea': this.roomArea,
      'price': this.price,
      'deposit': this.deposit,
      'electricityCost': this.electricityCost,
      'waterCost': this.waterCost,
      'postTitle': this.postTitle,
      'description': this.description,
      'address': this.address.toJson(),
      'owner': this.owner.toJson(),
    };
  }

  static Map<String, dynamic> createEmptyJsonRoom() {
    final room = Space(
        id: "",
        roomType: RoomType.roomForRent,
        numberOfRooms: 0,
        capacity: 0,
        roomArea: 0,
        price: 0,
        deposit: 0,
        electricityCost: 0,
        waterCost: 0,
        isSpaceForParking: false);
    return room.toJson();
  }
}
