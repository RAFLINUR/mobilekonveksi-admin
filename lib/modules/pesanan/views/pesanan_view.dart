import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔥 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DAFTAR PESANAN",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: Color(0xFF5B5FEF),
                    onPressed: () {},
                    child: Icon(Icons.add),
                  )
                ],
              ),

              SizedBox(height: 20),

              // 🔥 SEARCH
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari pelanggan atau ID...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),

              SizedBox(height: 20),

              // 🔥 LIST
              Expanded(
                child: ListView(
                  children: [
                    pesananCard(
                      "ORD-001",
                      "SMA Negeri 1",
                      "Kaos Olahraga (50)",
                      "2026-05-05",
                      "Rp 4.500.000",
                      "SEWING",
                    ),
                    pesananCard(
                      "ORD-002",
                      "PT Maju Jaya",
                      "Polo Shirt Karyawan (100)",
                      "2026-05-15",
                      "Rp 12.000.000",
                      "PENDING",
                    ),
                    pesananCard(
                      "ORD-003",
                      "Komunitas Sepeda",
                      "Jersey Printing (20)",
                      "2026-05-10",
                      "Rp 3.500.000",
                      "PRINTING",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // 🔥 CARD PESANAN
  Widget pesananCard(
    String id,
    String customer,
    String produk,
    String tanggal,
    String harga,
    String status,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔹 ID + STATUS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(id, style: TextStyle(color: Colors.grey)),
              statusBadge(status),
            ],
          ),

          SizedBox(height: 10),

          // 🔹 NAMA
          Text(customer,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

          SizedBox(height: 10),

          // 🔹 PRODUK + TANGGAL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.inventory_2_outlined, size: 16),
                  SizedBox(width: 5),
                  Text(produk),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16),
                  SizedBox(width: 5),
                  Text(tanggal),
                ],
              ),
            ],
          ),

          SizedBox(height: 15),

          // 🔹 HARGA
          Text("ESTIMASI PENJUALAN",
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 5),
          Text(
            harga,
            style: TextStyle(
              color: Color(0xFF5B5FEF),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  // 🔥 BADGE STATUS
  Widget statusBadge(String status) {
    Color bg;
    Color text;

    switch (status) {
      case "SEWING":
        bg = Colors.orange.withOpacity(0.2);
        text = Colors.orange;
        break;
      case "PRINTING":
        bg = Colors.blue.withOpacity(0.2);
        text = Colors.blue;
        break;
      default:
        bg = Colors.grey.withOpacity(0.2);
        text = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(status, style: TextStyle(color: text)),
    );
  }
}