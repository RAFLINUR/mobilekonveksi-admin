class StokModel {
  final String nama;
  final int jumlah;
  final String satuan;
  final int minimalStok;

  StokModel({
    required this.nama,
    required this.jumlah,
    required this.satuan,
    required this.minimalStok,
  });

  // 🔥 Status otomatis (tidak perlu diinput manual)
  String get status {
    if (jumlah == 0) return "habis";
    if (jumlah <= minimalStok) return "menipis";
    return "aman";
  }
}