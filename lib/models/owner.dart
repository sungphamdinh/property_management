import 'package:json_annotation/json_annotation.dart';

class Owner {
  @JsonKey(required: true)
  final String id;
  final String phoneNumber;
  Owner({this.id, this.phoneNumber});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(id: json['id'], phoneNumber: json['phoneNumber']);
  }

  Map<String, dynamic> toJson() {
    return {'id': this.id, 'phoneNumber': this.phoneNumber};
  }
}
