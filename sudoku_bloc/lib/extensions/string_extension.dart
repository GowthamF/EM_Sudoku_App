extension StringExtension on String {
  String getName() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
