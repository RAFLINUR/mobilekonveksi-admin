import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/produksi_controller.dart';

class ProduksiView extends GetView<ProduksiController> {
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
              Text(
                "PROSES PRODUKSI",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Pelacakan alur kerja real-time",
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 20),

              // 🔥 LIST
              Expanded(
                child: ListView(
                  children: [
                    produksiCard(
                        "SMA Negeri 1", "SEWING", 2),
                    produksiCard(
                        "PT Maju Jaya", "PENDING", 0),
                    produksiCard(
                        "Komunitas Sepeda", "PRINTING", 1),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // 🔥 CARD PRODUKSI
  Widget produksiCard(String title, String status, int activeStep) {
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

          // 🔹 TITLE + BUTTON
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5B5FEF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("UPDATE"),
              )
            ],
          ),

          SizedBox(height: 15),

          // 🔥 PROGRESS STEP
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              bool isActive = index <= activeStep;

              return Expanded(
                child: Row(
                  children: [
                    // 🔵 DOT
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: isActive
                            ? Color(0xFF5B5FEF)
                            : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),

                    // 🔵 LINE
                    if (index != 4)
                      Expanded(
                        child: Container(
                          height: 3,
                          color: isActive
                              ? Color(0xFF5B5FEF)
                              : Colors.grey.shade300,
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),

          SizedBox(height: 10),

          // 🔥 STATUS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  tagChip("T1"),
                  SizedBox(width: 5),
                  tagChip("T2"),
                ],
              ),
              Text("Divisi: $status",
                  style: TextStyle(color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }

  Widget tagChip(String text)  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0x1A5B5FEF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text,
          style: TextStyle(color: Color(0xFF5B5FEF))),
    );
  }
}