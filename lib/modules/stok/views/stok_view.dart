import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/stok_controller.dart';

class StokView extends GetView<StokController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔥 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "MANAJEMEN STOK",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  FloatingActionButton(
                    mini: true,
                    backgroundColor: const Color(0xFF5B5FEF),
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // 🔥 FILTER
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    tabItem("SEMUA", true),
                    tabItem("KAOS", false),
                    tabItem("TOTEBAG", false),
                    tabItem("ID CARD", false),
                    tabItem("POLO", false),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // 🔥 SEARCH
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari produk...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 LIST
              Expanded(
                child: ListView(
                  children: [

                    stokCard(
                      "Kaos Polos + Sablon",
                      "Ready Produksi",
                      120,
                      50,
                      false,
                    ),

                    stokCard(
                      "Totebag Polos + Sablon",
                      "Permintaan Tinggi",
                      35,
                      50,
                      true,
                    ),

                    stokCard(
                      "ID Card + Lanyard",
                      "Stok Aman",
                      80,
                      30,
                      false,
                    ),

                    stokCard(
                      "Kaos Polo Bordir",
                      "Pre Order",
                      20,
                      25,
                      true,
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

  // 🔥 TAB
  Widget tabItem(String title, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF5B5FEF)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: active
              ? Colors.white
              : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔥 CARD
  Widget stokCard(
    String name,
    String status,
    int stock,
    int minimum,
    bool critical,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔥 TITLE
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              if (critical)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "KRITIS",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ],
          ),

          const SizedBox(height: 8),

          Text(
            status,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 18),

          // 🔥 INFO
          Row(
            children: [

              Expanded(
                child: infoBox(
                  "Stok",
                  "$stock pcs",
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: infoBox(
                  "Minimum",
                  "$minimum pcs",
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // 🔥 BUTTON
          Row(
            children: [

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF5B5FEF),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "INPUT",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("UPDATE"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // 🔥 INFO BOX
  Widget infoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F2F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}