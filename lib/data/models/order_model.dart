class OrderModel {

  final String id;
  final String kodeOrder;
  final String namaCustomer;
  final String produk;
  final int jumlah;
  final String status;

  OrderModel({

    required this.id,
    required this.kodeOrder,
    required this.namaCustomer,
    required this.produk,
    required this.jumlah,
    required this.status,

  });

  factory OrderModel.fromJson(
    Map<String, dynamic> json,
  ){

    return OrderModel(

      id:
          json['id'] ?? '',

      kodeOrder:
          json['kode_order'] ?? '-',

      namaCustomer:
          json['nama_customer'] ?? '-',

      produk:
          json['produk'] ?? '-',

      jumlah:
          int.tryParse(
            json['jumlah'].toString(),
          ) ?? 0,

      status:
          json['status'] ?? '-',

    );

  }

}