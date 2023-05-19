extension StringExtensions on String {
  String toFirstLatterUpperCase() {
    List<String> listString = split('');

    listString.first = listString.first.toUpperCase();

    return listString.join();
  }

  bool get isNumeric {
    return double.tryParse(this) != null;
  }
}
