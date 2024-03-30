import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/api_endpoints.dart';
import '../../core/dio_error_exception.dart';
import '../models/response/get_email_token.dart';
//service class for GetEmailToken
class GetEmailTokenService{
  static final Dio dio = Dio();
  static Future<GetEmailToken?> getEmailToken({
    required String email,
  }) async {
    final url = ApiEndpoint.getEmailToken();
    FormData formData = FormData.fromMap({
      'email': MultipartFile.fromString(email),
    });
    try {
      var response = await dio.post(url,
          data: formData,
      );
      if (response.statusCode == 200) {
        var getEmailToken = GetEmailToken.fromJson(response.data);
        return getEmailToken;
      }
    } catch (e) {
      if (e is DioError) {
        final error = DioExceptions.fromDioError(e).toString();
        return GetEmailToken(message: error);
      }
    }
  }
}