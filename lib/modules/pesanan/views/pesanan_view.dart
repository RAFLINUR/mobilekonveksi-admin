import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_application_1/data/models/order_model.dart';

import 'package:flutter_application_1/data/services/order_service.dart';

import '../controllers/pesanan_controller.dart';

class PesananView
    extends StatelessWidget {

  PesananView({super.key});

  // ======================
  // INJECT CONTROLLER
  // ======================

  final PesananController controller =
      Get.put(PesananController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5F6FA),

      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.all(16),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // ======================
              // HEADER
              // ======================

              Row(

                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  const Text(

                    "DAFTAR PESANAN",

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight:
                          FontWeight.bold,

                    ),

                  ),

                  FloatingActionButton(

                    mini: true,

                    backgroundColor:
                        const Color(
                      0xFF5B5FEF,
                    ),

                    onPressed: () {},

                    child:
                        const Icon(Icons.add),

                  )

                ],

              ),

              const SizedBox(height: 20),

              // ======================
              // SEARCH
              // ======================

              TextField(

                decoration:
                    InputDecoration(

                  hintText:
                      "Cari pelanggan atau ID...",

                  prefixIcon:
                      const Icon(Icons.search),

                  filled: true,

                  fillColor: Colors.white,

                  border:
                      OutlineInputBorder(

                    borderRadius:
                        BorderRadius.circular(
                      12,
                    ),

                    borderSide:
                        BorderSide.none,

                  ),

                ),

              ),

              const SizedBox(height: 20),

              // ======================
              // LIST ORDERS
              // ======================

              Expanded(

                child: Obx(() {

                  // ======================
                  // LOADING
                  // ======================

                  if(controller
                      .isLoading.value){

                    return const Center(

                      child:
                          CircularProgressIndicator(),

                    );

                  }

                  // ======================
                  // EMPTY
                  // ======================

                  if(controller
                      .orders.isEmpty){

                    return const Center(

                      child: Text(
                        "Belum ada pesanan",
                      ),

                    );

                  }

                  // ======================
                  // LISTVIEW
                  // ======================

                  return ListView.builder(

                    itemCount:
                        controller.orders.length,

                    itemBuilder:
                        (context, index){

                      final order =
                          controller.orders[index];

                      return pesananCard(

                        order.kodeOrder,

                        order.namaCustomer,

                        "${order.produk} (${order.jumlah})",

                        "-",

                        "-",

                        order.status
                            .toUpperCase(),

                      );

                    },

                  );

                }),

              )

            ],

          ),

        ),

      ),

    );

  }

  // ======================
  // CARD PESANAN
  // ======================

  Widget pesananCard(

    String id,

    String customer,

    String produk,

    String tanggal,

    String harga,

    String status,

  ) {

    return Container(

      margin:
          const EdgeInsets.only(
        bottom: 15,
      ),

      padding:
          const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(15),

        boxShadow: [

          BoxShadow(

            color:
                Colors.black12,

            blurRadius: 5,

          )

        ],

      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // ======================
          // ID + STATUS
          // ======================

          Row(

            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

            children: [

              Text(

                id,

                style: const TextStyle(
                  color: Colors.grey,
                ),

              ),

              statusBadge(status),

            ],

          ),

          const SizedBox(height: 10),

          // ======================
          // CUSTOMER
          // ======================

          Text(

            customer,

            style: const TextStyle(

              fontWeight:
                  FontWeight.bold,

              fontSize: 16,

            ),

          ),

          const SizedBox(height: 10),

          // ======================
          // PRODUK
          // ======================

          Row(

            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

            children: [

              Expanded(

                child: Row(

                  children: [

                    const Icon(
                      Icons.inventory_2_outlined,
                      size: 16,
                    ),

                    const SizedBox(width: 5),

                    Expanded(
                      child: Text(produk),
                    ),

                  ],

                ),

              ),

              Row(

                children: [

                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                  ),

                  const SizedBox(width: 5),

                  Text(tanggal),

                ],

              ),

            ],

          ),

          const SizedBox(height: 15),

          // ======================
          // HARGA
          // ======================

          const Text(

            "ESTIMASI PENJUALAN",

            style: TextStyle(

              color: Colors.grey,

              fontSize: 12,

            ),

          ),

          const SizedBox(height: 5),

          Text(

            harga,

            style: const TextStyle(

              color: Color(0xFF5B5FEF),

              fontWeight:
                  FontWeight.bold,

              fontSize: 16,

            ),

          )

        ],

      ),

    );

  }

  // ======================
  // STATUS BADGE
  // ======================

  Widget statusBadge(
    String status,
  ) {

    Color bg;
    Color text;

    switch (status) {

      case "SEWING":

        bg = Colors.orange
            .withOpacity(0.2);

        text = Colors.orange;

        break;

      case "PRINTING":

        bg = Colors.blue
            .withOpacity(0.2);

        text = Colors.blue;

        break;

      case "PENDING":

        bg = Colors.grey
            .withOpacity(0.2);

        text = Colors.grey;

        break;

      case "DONE":

        bg = Colors.green
            .withOpacity(0.2);

        text = Colors.green;

        break;

      default:

        bg = Colors.black12;

        text = Colors.black;

    }

    return Container(

      padding:
          const EdgeInsets.symmetric(

        horizontal: 10,

        vertical: 5,

      ),

      decoration: BoxDecoration(

        color: bg,

        borderRadius:
            BorderRadius.circular(10),

      ),

      child: Text(

        status,

        style: TextStyle(
          color: text,
        ),

      ),

    );

  }

}