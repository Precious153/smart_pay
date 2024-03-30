import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/api_endpoints.dart';
import '../../core/dio_error_exception.dart';
import '../models/response/get_email_token.dart';
import '../models/response/register.dart';
import '../storage/storage.dart';
//service class for register
class RegisterService{
  static final Dio dio = Dio();
  static Future<RegisterResponse?> register({
    required String fullName,
    required String userName,
    required String email,
    required String country,
    required String password,
    required String deviceName,
  }) async {
    final url = ApiEndpoint.register();
    FormData formData = FormData.fromMap({
      'full_name': MultipartFile.fromString(fullName),
      'username': MultipartFile.fromString(userName),
      'email': MultipartFile.fromString(email),
      'country': MultipartFile.fromString(country),
      'password': MultipartFile.fromString(password),
      'device_name': MultipartFile.fromString(deviceName),
    });
    try {
      var response = await dio.post(url,
        data: formData,
      );
      if (response.statusCode == 200) {
        var register = RegisterResponse.fromJson(response.data);
        return register;
      }
    } catch (e) {
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return RegisterResponse(message: error);
      }
    }
  }
}