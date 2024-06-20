import 'package:intl/intl.dart';

String dateFormat(String date) {
  final DateTime dateTime = DateFormat('yyyy-MM-dd').parse(date);
  final String format = DateFormat('dd.MM.yyyy').format(dateTime);
  return format;
}
