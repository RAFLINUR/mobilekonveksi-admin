import 'package:get/get.dart';
import 'storage_service.dart';

class AuthService extends GetxService {

  late StorageService storage; // 🔥 pakai late

  var userName = "".obs;

  @override
  void onInit() {
    super.onInit();

    storage = Get.find<StorageService>(); // 🔥 di sini baru aman
    userName.value = storage.getUser();
  }

  void login(String name) {
    userName.value = name;
    storage.saveUser(name);
  }

  void logout() {
    userName.value = "";
    storage.removeUser();
  }
}