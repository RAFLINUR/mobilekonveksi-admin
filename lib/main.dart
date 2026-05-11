import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

import 'data/services/storage_service.dart';
import 'data/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // 🔥 INJECT DI SINI (SEKALI SAJA)
  Get.put(StorageService(), permanent: true);
  Get.put(AuthService(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Konveksi Cerdas",

      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.pages,
    );
  }
}