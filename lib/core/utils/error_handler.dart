import 'package:dio/dio.dart';

class ErrorHandler {
  static String getFriendlyError(Object error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout)
        return 'network';
      if (error.response?.statusCode == 401) {
        return 'unauthorized';
      }
      if ((error.response?.statusCode ?? 0) >= 500) {
        return 'server';
      }
    }
    return 'unknown';
  }
}
