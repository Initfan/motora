String formatRupiah(int value) {
  return 'Rp${value.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}';
}

String formatNumber(num value) {
  return value.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => '.',
  );
}

String formatTime(DateTime date) => "${date.hour}:${date.minute}";

String formatDuration(DateTime start, DateTime end) {
  final duration = end.difference(start);
  return "${duration.inHours}j ${duration.inMinutes.toString().substring(0, 2)}m";
}

String formatDistance(int distance) => "$distance km";
