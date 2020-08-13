class Validation {
  static isValidNumber(String value) {
    return value.isEmpty || (double.parse(value) < 1);
  }

  static isValidPhoneNumber(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
