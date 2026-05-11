import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/monitor_controller.dart';

class MonitorView extends GetView<MonitorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔥 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("KonveksiCerdas",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("Manajemen Produksi",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications_none),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Color(0xFF5B5FEF),
                        child: Text("BU"),
                      )
                    ],
                  )
                ],
              ),

              SizedBox(height: 20),

              // 🔥 ALERT CARD
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("KRITIS : STOK MENIPIS",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("Segera lakukan restock",
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("PESAN"),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 🔥 GRID
              Row(
                children: [
                  Expanded(child: statCard("3", "Pesanan Aktif")),
                  SizedBox(width: 10),
                  Expanded(child: statCard("1", "Stok Menipis")),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(child: statCard("Rp 20000K", "Estimasi Omzet")),
                  SizedBox(width: 10),
                  Expanded(child: statCard("2", "Deadline Dekat")),
                ],
              ),

              SizedBox(height: 20),

              // 🔥 LIST PESANAN
              Text("Pesanan Terbaru",
                  style: TextStyle(fontWeight: FontWeight.bold)),

              SizedBox(height: 10),

              orderCard("Komunitas Sepeda", "Printing"),
              orderCard("PT Maju Jaya", "Pending"),
              orderCard("SMA Negeri 1", "Sewing"),

              SizedBox(height: 20),

              // 🔥 AI CARD
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5B5FEF),
                      Color(0xFF7C3AED)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text("ASISTEN AI",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(
                      "Prediksi menunjukkan peningkatan permintaan dalam 7 hari ke depan.",
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: Text("Lihat Analisis"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget statCard(String value, String label) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  Widget orderCard(String title, String status) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(status),
          )
        ],
      ),
    );
  }
}