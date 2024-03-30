import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/api_endpoints.dart';
import '../../core/dio_error_exception.dart';
import '../models/response/get_email_token.dart';
import '../models/response/login.dart';
import '../models/response/register.dart';
import '../storage/storage.dart';
// service class for signIn
class LoginService{
  static final Dio dio = Dio();
  static Future<LoginResponse?> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    final url = ApiEndpoint.login();
    FormData formData = FormData.fromMap({
      'email': MultipartFile.fromString(email),
      'password': MultipartFile.fromString(password),
      'device_name': MultipartFile.fromString(deviceName),
    });
    try {
      var response = await dio.post(url,
        data: formData,
      );
      if (response.statusCode == 200) {
        var login = LoginResponse.fromJson(response.data);
        return login;
      }
    } catch (e) {
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return LoginResponse(message: error);
      }
    }
  }
}