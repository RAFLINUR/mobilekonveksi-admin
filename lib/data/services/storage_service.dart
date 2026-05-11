import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final box = GetStorage();

  final String userKey = "user_name";

  // 🔥 ambil user
  String getUser() {
    return box.read(userKey) ?? "";
  }

  // 🔥 simpan user
  void saveUser(String name) {
    box.write(userKey, name);
  }

  // 🔥 hapus user
  void removeUser() {
    box.remove(userKey);
  }

  // 🔥 cek login
  bool isLoggedIn() {
    return box.hasData(userKey);
  }
}