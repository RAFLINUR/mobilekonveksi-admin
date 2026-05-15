import 'package:get/get.dart';

import 'package:flutter_application_1/data/models/order_model.dart';

import 'package:flutter_application_1/data/services/order_service.dart';

class ProduksiController
    extends GetxController {

  // ======================
  // LOADING
  // ======================

  var isLoading = false.obs;

  // ======================
  // DATA ORDERS
  // ======================

  var orders =
      <OrderModel>[].obs;

  // ======================
  // STEP STATUS
  // ======================

  final steps = [

    "pending",

    "SEWING",

    "PRINTING",

    "DONE",

  ];

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
          await OrderService
              .fetchOrders();

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

  // ======================
  // UPDATE STATUS
  // ======================

  void updateStatus(

    String id,

    String status,

  ) async {

    try{

      await OrderService
          .updateStatus(

        id,

        status,

      );

      Get.snackbar(

        "Success",

        "Status berhasil diupdate",

      );

      // Refresh realtime
      fetchOrders();

    }catch(e){

      Get.snackbar(

        "Error",

        e.toString(),

      );

    }

  }

}