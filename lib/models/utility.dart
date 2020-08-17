class Utility {
  final String name;
  final int iconCodePoint;
  bool isSelected = false;
  Utility({this.name, this.iconCodePoint});

  void setSelection(bool isSelected) {
    this.isSelected = isSelected;
  }

  factory Utility.fromJson(Map<String, dynamic> json) {
    return Utility(name: json['name'], iconCodePoint: json['iconCodePoint']);
  }

  Map<String, dynamic> toJson() {
    return {'name': this.name, 'iconCodePoint': this.iconCodePoint};
  }
}
