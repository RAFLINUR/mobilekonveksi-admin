import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.pages[controller.currentIndex.value](),

          bottomNavigationBar: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFF1E1B4B),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 10)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navItem(Icons.dashboard, "Monitor", 0),
                navItem(Icons.list_alt, "Pesanan", 1),
                navItem(Icons.settings, "Produksi", 2),
                navItem(Icons.inventory, "Stok", 3),
                navItem(Icons.psychology, "Cerdas", 4),
              ],
            ),
          ),
        ));
  }

  Widget navItem(IconData icon, String label, int index) {
    final isActive = controller.currentIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive ? Color(0xFF5B5FEF) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon,
                color: isActive ? Colors.white : Colors.white54),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}