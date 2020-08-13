import 'package:json_annotation/json_annotation.dart';
import 'package:property_management/models/address.dart';
import 'package:property_management/models/owner.dart';

part 'space.g.dart';

enum RoomType { roomForRent, roomForShare, house, apartment }

@JsonSerializable()
class Space {
  @JsonKey(required: true)
  String id;

  @JsonKey(defaultValue: RoomType.roomForShare)
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

  @JsonKey(defaultValue: false)
  final bool isSpaceForParking;

  Space(
      {this.id,
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

  factory Space.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);

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
    return _$RoomToJson(room);
  }
}
