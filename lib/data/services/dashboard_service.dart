import 'dart:convert';

import 'package:http/http.dart'
    as http;

import 'package:flutter_application_1/data/models/dashboard_model.dart';

class DashboardService {

  // GANTI SESUAI IP LAPTOP
  static const String baseUrl =
      'http://192.168.1.33:5000/api/dashboard';

  // ======================
  // FETCH DASHBOARD
  // ======================

  static Future<DashboardModel>
  fetchDashboard() async {

    final response =
        await http.get(

      Uri.parse(baseUrl),

    );

    if(response.statusCode == 200){

      final data =
          jsonDecode(response.body);

      return DashboardModel.fromJson(

        data['data'],

      );

    }else{

      throw Exception(

        'Failed to load dashboard',

      );

    }

  }

}