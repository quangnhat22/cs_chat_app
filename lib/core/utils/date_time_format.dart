import 'package:intl/intl.dart';

class AppDateTimeFormat {
  AppDateTimeFormat._();

  static String formatDDMMYYYY(DateTime? date) {
    return date != null
        ? DateFormat('dd-MM-yyyy').format(date)
        : DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  static DateTime parseDDMMYYYY(String? string) {
    return string != null
        ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(string)
        : DateTime.now();
  }
}
