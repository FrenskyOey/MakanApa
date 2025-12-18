extension DateTimeExtensions on DateTime {
  // --- Formatting Getters ---

  /// Returns the date formatted as 'YYYY-MM-DD'.
  String get toIsoDateString {
    return '$year-${_twoDigits(month)}-${_twoDigits(day)}';
  }

  /// Returns the time formatted as 'HH:MM'.
  String get toTimeString {
    return '${_twoDigits(hour)}:${_twoDigits(minute)}';
  }

  String get toTimeSecondString {
    return '${_twoDigits(hour)}:${_twoDigits(minute)}:${_twoDigits(second)}';
  }

  /// Returns a readable date format, e.g., 'Oct 24, 2025'.
  String toReadableDate({String separator = ', '}) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    const dayNames = [
      // Index 0 (unused, since ISO weekday starts at 1)
      'Senin', // Index 1
      'Selasa', // Index 2
      'Rabu', // Index 3
      'Kamis', // Index 4
      'Jumat', // Index 5
      'Sabtu', // Index 6
      'Minggu', // Index 7
    ];

    final monthName = months[month - 1];
    final dayIndex = dayNames[weekday - 1];
    return '$dayIndex, $day $monthName $year';
  }

  /// Returns a readable date format, e.g., 'Oct 24, 2025'.
  String get toReadableDateWithDays {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final monthName = months[month - 1];
    return '$day $monthName $year';
  }

  /// Returns a readable date format, e.g., 'Oct 24, 2025'.
  String get toReadableDateWithoutYear {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final monthName = months[month - 1];
    return '$day $monthName';
  }

  // --- Comparison & Utility ---

  /// Checks if this date falls on today.
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Checks if this date falls on yesterday.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Checks if this date falls on tomorrow.
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Checks if this date is the same day as another date, ignoring time.
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Returns a new DateTime object representing only the date part (time set to midnight).
  DateTime get dateOnly => DateTime(year, month, day);

  // --- Private Helper ---
  String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}

// Example Usage:
/*
DateTime now = DateTime.now();
DateTime tomorrow = now.add(const Duration(days: 1));

String todayDate = now.toReadableDate(); // e.g., "Oct 24, 2025"
String time = now.toTimeString;         // e.g., "16:40"

if (tomorrow.isTomorrow) {
  print('This event is tomorrow!');
}
*/
