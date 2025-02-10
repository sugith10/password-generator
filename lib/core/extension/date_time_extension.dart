import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get formattedDate => DateFormat('d MMM yyyy').format(this);
  String get formattedTime => DateFormat('HH:mm').format(this);
}
