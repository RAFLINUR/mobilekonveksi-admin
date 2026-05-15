import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/produksi_controller.dart';

class ProduksiView extends StatelessWidget {

  ProduksiView({super.key});

  final ProduksiController controller =
      Get.put(ProduksiController());

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

              const Text(

                "PROSES PRODUKSI",

                style: TextStyle(

                  fontSize: 20,

                  fontWeight:
                      FontWeight.bold,

                ),

              ),

              const Text(

                "Pelacakan alur kerja real-time",

                style: TextStyle(
                  color: Colors.grey,
                ),

              ),

              const SizedBox(height: 20),

              // ======================
              // LIST PRODUKSI
              // ======================

              Expanded(

                child: Obx(() {

                  // LOADING
                  if(controller
                      .isLoading.value){

                    return const Center(

                      child:
                          CircularProgressIndicator(),

                    );

                  }

                  // EMPTY
                  if(controller
                      .orders.isEmpty){

                    return const Center(

                      child: Text(
                        "Belum ada produksi",
                      ),

                    );

                  }

                  // LISTVIEW
                  return ListView.builder(

                    itemCount:
                        controller.orders.length,

                    itemBuilder:
                        (context, index){

                      final order =
                          controller.orders[index];

                      int activeStep = 0;

                      if(order.status
                          == "SEWING"){

                        activeStep = 1;

                      }else if(order.status
                          == "PRINTING"){

                        activeStep = 2;

                      }else if(order.status
                          == "DONE"){

                        activeStep = 3;

                      }

                      return produksiCard(

                        order.id,

                        order.namaCustomer,

                        order.status,

                        activeStep,

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
  // CARD PRODUKSI
  // ======================

  Widget produksiCard(

    String id,

    String title,

    String status,

    int activeStep,

  ){

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

        boxShadow: const [

          BoxShadow(

            color: Colors.black12,

            blurRadius: 5,

          )

        ],

      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // ======================
          // TITLE + BUTTON
          // ======================

          Row(

            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

            children: [

              Text(

                title,

                style: const TextStyle(

                  fontWeight:
                      FontWeight.bold,

                ),

              ),

              PopupMenuButton<String>(

                onSelected: (value){

                  controller.updateStatus(

                    id,

                    value,

                  );

                },

                itemBuilder: (context) => [

                  const PopupMenuItem(

                    value: "pending",

                    child: Text(
                      "Pending",
                    ),

                  ),

                  const PopupMenuItem(

                    value: "SEWING",

                    child: Text(
                      "Sewing",
                    ),

                  ),

                  const PopupMenuItem(

                    value: "PRINTING",

                    child: Text(
                      "Printing",
                    ),

                  ),

                  const PopupMenuItem(

                    value: "DONE",

                    child: Text(
                      "Done",
                    ),

                  ),

                ],

                child: Container(

                  padding:
                      const EdgeInsets.symmetric(

                    horizontal: 14,

                    vertical: 10,

                  ),

                  decoration: BoxDecoration(

                    color:
                        const Color(0xFF5B5FEF),

                    borderRadius:
                        BorderRadius.circular(10),

                  ),

                  child: const Text(

                    "UPDATE",

                    style: TextStyle(
                      color: Colors.white,
                    ),

                  ),

                ),

              )

            ],

          ),

          const SizedBox(height: 15),

          // ======================
          // STEP PROGRESS
          // ======================

          Row(

            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

            children: List.generate(4,
                (index){

              bool isActive =
                  index <= activeStep;

              return Expanded(

                child: Row(

                  children: [

                    // DOT
                    Container(

                      width: 14,

                      height: 14,

                      decoration:
                          BoxDecoration(

                        color: isActive

                            ? const Color(
                                0xFF5B5FEF)

                            : Colors
                                .grey.shade300,

                        shape:
                            BoxShape.circle,

                      ),

                    ),

                    // LINE
                    if(index != 3)

                      Expanded(

                        child: Container(

                          height: 3,

                          color: isActive

                              ? const Color(
                                  0xFF5B5FEF)

                              : Colors.grey
                                  .shade300,

                        ),

                      ),

                  ],

                ),

              );

            }),

          ),

          const SizedBox(height: 15),

          // ======================
          // STATUS
          // ======================

          Align(

            alignment:
                Alignment.centerRight,

            child: Text(

              "Status : ${status.toUpperCase()}",

              style: const TextStyle(

                color: Colors.grey,

              ),

            ),

          )

        ],

      ),

    );

  }

}