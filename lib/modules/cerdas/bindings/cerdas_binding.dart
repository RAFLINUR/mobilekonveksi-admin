import 'package:get/get.dart';
import '../controllers/cerdas_controller.dart';

class CerdasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CerdasController>(
      () => CerdasController(),
    );
  }
}