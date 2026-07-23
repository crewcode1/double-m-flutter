import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);
  String get formattedTime => DateFormat('hh:mm a').format(this);
  String get formattedDateTime => DateFormat('dd/MM/yyyy hh:mm a').format(this);
}
