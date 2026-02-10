import 'package:dio/dio.dart';

import 'exceptions.dart';

class DioErrorHandler {
  static Exception handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerException(message: "Connection timeout");
      case DioExceptionType.connectionError:
        return NetworkException(message: "No internet connection");
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode == 401) {
          return UnauthorizedException(message: "Unauthorized");
        }
        final message = error.response?.statusMessage ?? "Server error";
        return ServerException(message: message);
      case DioExceptionType.cancel:
        return ServerException(message: "Request cancelled");
      default:
        return ServerException(message: error.message ?? "Unexpected error");
    }
  }
}
