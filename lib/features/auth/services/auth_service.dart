import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl:
          'https://krgb6fwb7h.execute-api.ap-south-1.amazonaws.com/dev/api/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<void> setAuthHeader() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_key");
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future<bool> login(String email, String password) async {
    try {
      final response = await dio.post(
        'auth/jwt/create',
        data: {"email": email, "password": password},
      );
      final access = response.data['access'];
      final refresh = response.data['refresh'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_key', access);
      await prefs.setString('refresh_token', refresh);
      await prefs.setBool("is_logged_in", true);
      return true;
    } catch (e) {
      print("Login error: $e");
      return false;
    }
  }

  static Future<Map<String, dynamic>?> getUserDetails() async {
    try {
      await setAuthHeader();
      final response = await dio.get("auth/users/me/");
      print("User data:- \n${response.data}");
      return response.data;
    } catch (e) {
      print("User error:- $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getCompanyDetails() async {
    try {
      await setAuthHeader();
      final response = await dio.get(
        'accounts/companies/',
        queryParameters: {'owner': 1},
      );
      // print("Company data: ${response.data}");
      return response.data;
    } catch (e) {
      print("Company error:- $e");
      return null;
    }
  }

  static Future<List< dynamic>> getSalesInvoices({String query = ""}) async {
    try {
      await setAuthHeader();
      var companyId = await getCompanyDetails();
      final response = await dio.get(
        'invoices/sales/?company_id=${companyId!["results"][0]["id"]}&search=$query',
      );
      return response.data["results"];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
