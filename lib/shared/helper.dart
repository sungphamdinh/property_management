class Helper {
  static T encodeEnum<T>(
      Map<T, dynamic> enumValues, dynamic source, T fallBackValue) {
    if (source == null) {
      return fallBackValue;
    }
    final foundItem =
        enumValues.entries.singleWhere((entry) => entry.key == source);

    if (foundItem == null) {
      return fallBackValue;
    }
    return foundItem.key;
  }
}
