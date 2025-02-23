import 'package:intl/intl.dart';

extension DateTimeFormatParsing on String {
  String formatDate() => DateFormat.yMMMd('ES').format(DateTime.parse(this));
}
