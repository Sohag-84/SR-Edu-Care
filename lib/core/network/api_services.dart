import 'package:dio/dio.dart';
import 'dio_client.dart';

class ApiService {
  /// GET REQUEST
  static Future<Response> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    try {
      return await DioClient.dio.get(path, queryParameters: query);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// POST REQUEST
  static Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await DioClient.dio.post(path, data: data, queryParameters: query);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// GLOBAL ERROR FORMAT
  static Exception _handleError(DioException e) {
    final message =
        e.response?.data?['message'] ?? e.message ?? 'Something went wrong';
    return Exception(message);
  }
}
