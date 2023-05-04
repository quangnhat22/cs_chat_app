import 'package:intl/intl.dart';

class AppDateTimeFormat {
  AppDateTimeFormat._();

  static String formatDDMMYYYY(DateTime? date) {
    return date != null
        ? DateFormat('dd-MM-yyyy').format(date)
        : DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
}
