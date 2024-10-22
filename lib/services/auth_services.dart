import 'package:adopt_app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final Dio _dio = Dio();
  late String token;
  final baseUrl = 'https://coded-pets-api-auth.eapi.joincoded.com';

  Future<String> signUp({required User user}) async {
    try {
      Response response = await _dio.post(baseUrl + '/signup', data: user.toJson());
      token = response.data["token"];
    } catch (error) {
      print(error);
    }
    return token;
  }
}