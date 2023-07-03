import 'dart:convert';
import 'package:http/http.dart';

import 'package:dio/dio.dart';


void login(String email, password) async {
  try {
    final response = await post(
        Uri.parse('https://excellis.co.in/420-society-world/api/v1/register'),
        body: {
          'name': 'Tony Nelson',
          'email': 'tony@yopmail.com',
          'phone': '7485968695',
          'password': '12345678',
          'confirm_password':'12345678'

        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('Login successfully');
    } else {
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
