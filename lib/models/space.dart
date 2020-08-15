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
  String _id;
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
  final List<String> imageUrls;

  Space(
      {this.roomType,
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
      this.description,
      this.imageUrls});

  void setId(String id) {
    this._id = id;
  }

  String get id => _id;

  static String convertRoomType(RoomType roomType) {
    return RoomTypeMaps[roomType];
  }

  static List<String> _getImages(List<dynamic> json) {
    return json.map((e) => e.toString()).toList();
  }

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
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
        owner: Owner.fromJson(json['owner']),
        imageUrls: _getImages(json['imageUrls']));
  }
  Map<String, dynamic> toJson() {
    return {
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
      'imageUrls': this.imageUrls
    };
  }
}
