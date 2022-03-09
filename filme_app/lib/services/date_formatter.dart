import 'package:intl/intl.dart';

String? dateTimeStringFormattedYear(n) {
  String date = DateFormat.y().format(DateTime.parse(n)).toString();

  return date;
}
