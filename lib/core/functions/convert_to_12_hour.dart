import 'package:intl/intl.dart';

String convertTo12HourFormat(String time24) {
  DateTime parsedTime = DateFormat('HH:mm').parse(time24);
  String formattedTime = DateFormat('hh:mm a').format(parsedTime);

  return formattedTime;
}
