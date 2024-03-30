import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/api_endpoints.dart';
import '../../core/dio_error_exception.dart';
import '../models/response/get_email_token.dart';
// service for verify email
class VerifyEmailService{
  static final Dio dio = Dio();
  static Future<GetEmailToken?> verifyEmail({
    required String email,
    required String token,
  }) async {
    final url = ApiEndpoint.verifyEmail();
    FormData formData = FormData.fromMap({
      'email': MultipartFile.fromString(email),
      'token': MultipartFile.fromString(token),
    });
    try {
      var response = await dio.post(url,
        data: formData,
      );
      if (response.statusCode == 200) {
        var verifyEmail = GetEmailToken.fromJson(response.data);
        return verifyEmail;
      }
    } catch (e) {
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return GetEmailToken(message: error);
      }
    }
  }
}