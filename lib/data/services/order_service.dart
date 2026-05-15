import 'dart:convert';

import 'package:http/http.dart'
    as http;

import 'package:flutter_application_1/data/models/order_model.dart';

class OrderService {

  static const String baseUrl =
      'http://192.168.1.33:5000/api';

  // ======================
  // FETCH ORDERS
  // ======================

  static Future<List<OrderModel>>
  fetchOrders() async {

    final response =
        await http.get(

      Uri.parse(
        '$baseUrl/orders',
      ),

    );

    if(response.statusCode == 200){

      final data =
          jsonDecode(response.body);

      final List orders =
          data['data'];

      return orders.map((e){

        return OrderModel.fromJson(e);

      }).toList();

    }else{

      throw Exception(
        'Failed to load orders',
      );

    }

  }

  // ======================
  // UPDATE STATUS
  // ======================

  static Future<void>
  updateStatus(

    String id,

    String status,

  ) async {

    final response =
        await http.put(

      Uri.parse(

        '$baseUrl/update-status/$id',

      ),

      headers: {

        'Content-Type':
            'application/json',

      },

      body: jsonEncode({

        'status': status,

      }),

    );

    if(response.statusCode != 200){

      throw Exception(

        'Failed to update status',

      );

    }

  }

}