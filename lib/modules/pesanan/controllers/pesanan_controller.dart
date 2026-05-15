import 'package:get/get.dart';

import 'package:flutter_application_1/data/models/order_model.dart';

import 'package:flutter_application_1/data/services/order_service.dart';

class PesananController
    extends GetxController {

  // Loading
  var isLoading = false.obs;

  // Data Orders
  var orders =
      <OrderModel>[].obs;

  @override
  void onInit() {

    super.onInit();

    fetchOrders();

  }

  // ======================
  // FETCH ORDERS
  // ======================

  void fetchOrders() async {

    try{

      isLoading.value = true;

      final result =
          await OrderService.fetchOrders();

      orders.assignAll(result);

    }catch(e){

      Get.snackbar(

        "Error",

        e.toString(),

      );

    }finally{

      isLoading.value = false;

    }

  }

}