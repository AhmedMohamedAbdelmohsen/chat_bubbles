import 'package:intl/intl.dart';

///initial formatter to find the date txt
final DateFormat _formatter = DateFormat('yyyy-MM-dd');

///[DateChipText] class included with algorithms which are need to implement [DateChip]
///[date] parameter is required
///
class DateChipText {
  final DateTime date;

  DateChipText(this.date);

  ///generate and return [DateChip] string
  ///
  ///
  String getText() {
    final now = DateTime.now();
    final fiveDaysAgo = now.subtract(Duration(days: 5));

    if (_formatter.format(now) == _formatter.format(date)) {
      return 'Today';
    } else if (_formatter.format(now.subtract(Duration(days: 1))) ==
        _formatter.format(date)) {
      return 'Yesterday';
    } else if (date.isAfter(fiveDaysAgo)) {
      // If the date is within the last 5 days, return the name of the day
      return DateFormat('EEEE').format(date);
    } else {
      return '${DateFormat('d').format(date)} ${DateFormat('MMMM').format(date)} ${DateFormat('y').format(date)}';
    }
  }
}
