import 'package:get/get.dart';

class CerdasController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    simulateLoading();
  }

  void simulateLoading() async {
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
  }

  void refreshData() {
    isLoading.value = true;
    simulateLoading();
  }
}