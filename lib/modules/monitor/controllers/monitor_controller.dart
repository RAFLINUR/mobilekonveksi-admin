import 'package:get/get.dart';

import 'package:flutter_application_1/data/models/dashboard_model.dart';

import 'package:flutter_application_1/data/services/dashboard_service.dart';

import 'package:flutter_application_1/data/models/order_model.dart';

import 'package:flutter_application_1/data/services/order_service.dart';

class MonitorController extends GetxController {
  // ======================
  // LOADING
  // ======================

  var isLoading = false.obs;

  // ======================
  // DASHBOARD DATA
  // ======================

  Rxn<DashboardModel> dashboard = Rxn<DashboardModel>();

  var latestOrders = <OrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchDashboard();

    fetchLatestOrders();
  }

  // ======================
  // FETCH DASHBOARD
  // ======================

  void fetchDashboard() async {
    try {
      isLoading.value = true;

      final result = await DashboardService.fetchDashboard();

      dashboard.value = result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchLatestOrders() async {
    try {
      final result = await OrderService.fetchOrders();

      latestOrders.assignAll(result.take(3).toList());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
