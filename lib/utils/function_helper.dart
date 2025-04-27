DateTime todayAt(int hour, int minute, [int second = 0]) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, hour, minute, second);
}

String formatTwoDigits(int number) {
  return number.toString().padLeft(2, '0');
}
