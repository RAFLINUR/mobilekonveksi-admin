import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/monitor_controller.dart';

class MonitorView extends StatelessWidget {
  MonitorView({super.key});

  final MonitorController controller = Get.put(MonitorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // ======================
              // HEADER
              // ======================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        "KonveksiCerdas",

                        style: TextStyle(
                          fontWeight: FontWeight.bold,

                          fontSize: 20,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "Manajemen Produksi",

                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const Icon(Icons.notifications_none),

                      const SizedBox(width: 10),

                      CircleAvatar(
                        backgroundColor: const Color(0xFF5B5FEF),

                        child: const Text("BU"),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ======================
              // ALERT CARD
              // ======================
              Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
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
                        const Text(
                          "KRITIS : STOK MENIPIS",

                          style: TextStyle(
                            color: Colors.white,

                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "Segera lakukan restock",

                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    ElevatedButton(
                      onPressed: () {},

                      child: const Text("PESAN"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ======================
              // DASHBOARD REALTIME
              // ======================
              Obx(() {
                // LOADING
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                // EMPTY
                if (controller.dashboard.value == null) {
                  return const Center(child: Text("Tidak ada data"));
                }

                final data = controller.dashboard.value!;

                return Column(
                  children: [
                    // ======================
                    // ROW 1
                    // ======================
                    Row(
                      children: [
                        Expanded(
                          child: statCard(
                            data.totalOrder.toString(),

                            "Total Order",
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: statCard(data.pending.toString(), "Pending"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ======================
                    // ROW 2
                    // ======================
                    Row(
                      children: [
                        Expanded(
                          child: statCard(data.sewing.toString(), "Sewing"),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: statCard(data.printing.toString(), "Printing"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ======================
                    // ROW 3
                    // ======================
                    Row(
                      children: [
                        Expanded(child: statCard(data.done.toString(), "Done")),
                      ],
                    ),
                  ],
                );
              }),

              const SizedBox(height: 20),

              // ======================
              // LIST PESANAN
              // ======================
              const Text(
                "Pesanan Terbaru",

                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 10),

              Obx(() {
                return Column(
                  children: controller.latestOrders.map((order) {
                    return orderCard(
                      order.namaCustomer,

                      order.status.toUpperCase(),
                    );
                  }).toList(),
                );
              }),

              // ======================
              // AI CARD
              // ======================
              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF5B5FEF), Color(0xFF7C3AED)],
                  ),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    const Text(
                      "ASISTEN AI",

                      style: TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.bold,

                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Prediksi menunjukkan peningkatan permintaan dalam 7 hari ke depan.",

                      style: TextStyle(color: Colors.white70),

                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),

                      child: const Text("Lihat Analisis"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ======================
  // STAT CARD
  // ======================

  Widget statCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [
          Text(
            value,

            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

          const SizedBox(height: 5),

          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // ======================
  // ORDER CARD
  // ======================

  Widget orderCard(String title, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(title),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),

              borderRadius: BorderRadius.circular(10),
            ),

            child: Text(status),
          ),
        ],
      ),
    );
  }
}
