library string_extension;

/// Provides custom utility methods on [String].
extension StringExtension on String {
  /// Capitalizes the first letter of this string.
  ///
  /// Returns a new string with the first letter capitalized.
  /// If this string is empty, returns the original string.
  String capitalizeFirst() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Converts this string to an enum value of type [T] by matching it with the names of enum values in [values].
  ///
  /// Compares this string (case-insensitive) with the name of each enum value in [values].
  ///
  /// Returns the matching enum value of type [T].
  ///
  /// Throws a [StateError] if no match is found.
  T toEnum<T extends Enum>(List<T> values) {
    return values.firstWhere(
          (e) => e.toString().split('.').last.toUpperCase() == toUpperCase(),
      orElse: () => throw StateError('No matching enum value for $this'),
    );
  }
}