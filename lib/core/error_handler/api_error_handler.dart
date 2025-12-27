import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sr_edu_care/core/error_handler/failure.dart';

class ApiErrorHandler {
  static Failure handle(dynamic e) {
    if (e is DioException) {
      String? apiMessage;

      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        apiMessage = data['message']?.toString();
      } else if (data is String) {
        apiMessage = data;
      }

      // NO INTERNET
      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        return const NetworkFailure("No Internet Connection");
      }

      switch (e.response?.statusCode) {
        case 401:
          return UnauthorizedFailure(
            apiMessage ?? "Unauthorized. Please login again.",
          );

        case 403:
          return ForbiddenFailure(
            apiMessage ?? "You don't have permission to access this resource",
          );

        case 400:
        case 404:
        case 500:
          return ServerFailure(apiMessage ?? "Something went wrong");
      }

      return ServerFailure(apiMessage ?? "Unexpected error occurred");
    }

    if (e is SocketException) {
      return const NetworkFailure("No Internet Connection");
    }

    return const ServerFailure("Something went wrong");
  }
}
