import 'package:intl/intl.dart';

class TimeConverter {
  /// Returns date format in 'dd MMM yyyy'
  static String getProperDate(DateTime originalDate) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formattedDate = formatter.format(originalDate);
    return formattedDate;
  }

  static DateTime stringToDate(String dateSaved) {
    return DateFormat('dd MMM yyyy').parse(dateSaved);
  }
}
