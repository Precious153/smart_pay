
import 'package:dio/dio.dart';
// dio exception to catch error
class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Network error";
        break;
      case DioErrorType.unknown:
        message = "Server error";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout";
        break;
      case DioErrorType.badResponse:
        message =
            _handleError(dioError.response?.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  static String message = '';

  String _handleError(dynamic error) {
    return error["message"];
  }

  @override
  String toString() => message;
}