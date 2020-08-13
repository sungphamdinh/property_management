// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space _$RoomFromJson(Map<String, dynamic> json) {
  return Space(
    id: json['id'] as String,
    roomType: _$enumDecodeNullable(_$RoomTypeEnumMap, json['roomType']) ??
        RoomType.roomForShare,
    numberOfRooms: json['numberOfRooms'] as int,
    capacity: json['capacity'] as int,
    roomArea: (json['roomArea'] as num)?.toDouble(),
    price: (json['price'] as num)?.toDouble(),
    deposit: (json['deposit'] as num)?.toDouble(),
    electricityCost: (json['electricityCost'] as num)?.toDouble(),
    waterCost: (json['waterCost'] as num)?.toDouble(),
    isSpaceForParking: json['isSpaceForParking'] as bool ?? false,
  );
}

Map<String, dynamic> _$RoomToJson(Space instance) => <String, dynamic>{
      'id': instance.id,
      'roomType': _$RoomTypeEnumMap[instance.roomType],
      'numberOfRooms': instance.numberOfRooms,
      'capacity': instance.capacity,
      'roomArea': instance.roomArea,
      'price': instance.price,
      'deposit': instance.deposit,
      'electricityCost': instance.electricityCost,
      'waterCost': instance.waterCost,
      'isSpaceForParking': instance.isSpaceForParking,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$RoomTypeEnumMap = {
  RoomType.roomForRent: 'roomForRent',
  RoomType.roomForShare: 'roomForShare',
  RoomType.house: 'house',
  RoomType.apartment: 'apartment',
};
