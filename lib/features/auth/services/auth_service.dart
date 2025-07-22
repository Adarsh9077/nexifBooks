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
    final token = prefs.getString("access_token");
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
      return true;
    } catch (e) {
      print("Login error: $e");
      return false;
    }
  }

  static Future<void> getUserDetails() async {
    await setAuthHeader();
    final response = await dio.get("auth/users/me/");
    print("User data \n${response.data}");
  }

  static Future<void> getCompanyDetails() async {
    await setAuthHeader();
    final response = await dio.get(
      'accounts/companies/',
      queryParameters: {'owner': 1},
    );
    print("Company data: ${response.data}");
  }
}
