import 'package:json_annotation/json_annotation.dart';

class Owner {
  @JsonKey(required: true)
  final String id;
  final String phoneNumber;
  Owner({this.id, this.phoneNumber});
}
