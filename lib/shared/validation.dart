class Validation {
  static isValidNumber(String value) {
    return value.isEmpty || (double.parse(value) < 1);
  }
}
