class Address {
  final String city;
  final String district;
  final String ward;
  final String streetName;
  final String houseNumber;
  Address(
      {this.city, this.district, this.ward, this.streetName, this.houseNumber});

  String get readableAddress => "$houseNumber $streetName, $district $city";

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        city: json['city'],
        district: json['district'],
        ward: json['ward'],
        streetName: json['streetName'],
        houseNumber: json['houseNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'city': this.city,
      'district': this.district,
      'ward': this.ward,
      'streetName': this.streetName,
      'houseNumber': this.houseNumber
    };
  }
}
