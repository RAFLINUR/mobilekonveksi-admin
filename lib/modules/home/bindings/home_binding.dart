import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../cerdas/controllers/cerdas_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<CerdasController>(
      () => CerdasController(),
    );
  }
}