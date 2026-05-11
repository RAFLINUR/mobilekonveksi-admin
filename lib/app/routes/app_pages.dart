import 'package:get/get.dart';

import '../../modules/login/views/login_view.dart';
import '../../modules/login/bindings/login_binding.dart';

import '../../modules/home/views/home_view.dart';
import '../../modules/home/bindings/home_binding.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
