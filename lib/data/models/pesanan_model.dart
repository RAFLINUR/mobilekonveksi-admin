class PesananModel {
  final String nama;
  final String status;
  final DateTime? tanggal;
  final int? jumlah;

  PesananModel({
    required this.nama,
    required this.status,
    this.tanggal,
    this.jumlah,
  });
}