extension NullableStringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension StringExtensions on String {
  String firstLetterToLowerCase() {
    return this[0].toLowerCase() + substring(1);
  }
}