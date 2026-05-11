import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cerdas_controller.dart';

class CerdasView extends GetView<CerdasController> {
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

              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.psychology, color: Color(0xFF5B5FEF)),
                      SizedBox(width: 10),
                      Text(
                        "ANALISIS CERDAS",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: controller.refreshData,
                  )
                ],
              ),

              SizedBox(height: 60),

              // LOADING / RESULT
              Expanded(
                child: Center(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                              color: Color(0xFF5B5FEF),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "MENGHITUNG PREDIKSI BISNIS...",
                            style: TextStyle(
                                color: Colors.grey,
                                letterSpacing: 1),
                          ),
                        ],
                      );
                    } else {
                      return Container(
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "ASISTEN AI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Prediksi menunjukkan peningkatan permintaan dalam 7 hari ke depan.",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(height: 15),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Color(0xFF5B5FEF),
                              ),
                              onPressed: () {},
                              child: Text("LIHAT ANALISIS DETAIL"),
                            )
                          ],
                        ),
                      );
                    }
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}