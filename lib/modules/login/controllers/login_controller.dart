import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../data/services/auth_service.dart';
import '../../../app/routes/app_routes.dart';

class LoginController extends GetxController {
  late AuthService auth;

  @override
  void onInit() {
    super.onInit();
    auth = Get.find<AuthService>();
  }

  final users = [
    UserModel(id: "1", nama: "Agus Salim"),
    UserModel(id: "2", nama: "Budi Santoso"),
    UserModel(id: "3", nama: "Siti Aminah"),
  ];

  void login(UserModel user) {
    auth.login(user.nama);
    Get.offAllNamed(AppRoutes.HOME);
  }
}