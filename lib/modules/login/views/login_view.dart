import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              const SizedBox(height: 40),

              // 🔷 ICON
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF5B5FEF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.psychology,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 20),

              // 🔤 TITLE
              const Text(
                "KONVEKSI",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "CERDAS",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B5FEF),
                ),
              ),

              const SizedBox(height: 10),

              // 📝 DESKRIPSI
              const Text(
                "Sistem Manajemen Produksi Modern\nberbasis Kecerdasan Buatan.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // 🔽 SUBTITLE
              const Text(
                "PILIH USER",
                style: TextStyle(
                  color: Color(0xFF5B5FEF),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // 📋 LIST USER
              Expanded(
                child: ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final user = controller.users[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: ListTile(
                        onTap: () => controller.login(user),

                        // 👤 AVATAR
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color(0xFF5B5FEF).withOpacity(0.2),
                          child: Text(
                            user.initial,
                            style: const TextStyle(
                              color: Color(0xFF5B5FEF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // 🧑 NAMA
                        title: Text(
                          user.nama,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // ➡️ ICON
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}