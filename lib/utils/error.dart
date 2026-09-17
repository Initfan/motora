String getErrorMessage(Object error) {
  final message = error.toString();

  if (message.contains('SocketException')) {
    return 'Tidak dapat terhubung ke server.';
  }

  if (message.contains('401')) {
    return 'Sesi login kamu telah berakhir.';
  }

  return 'Gagal mengambil data.';
}
