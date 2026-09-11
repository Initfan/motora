String formatRupiah(int value) {
  final formatted = value.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => '.',
  );

  return 'Rp$formatted';
}
