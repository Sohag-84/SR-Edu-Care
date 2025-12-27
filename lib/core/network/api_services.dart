import 'package:dio/dio.dart';
import 'dio_client.dart';

class ApiService {
  /// GET REQUEST
  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      return await DioClient.dio.get(path, queryParameters: query);
    } on DioException catch (_) {
      rethrow;
    }
  }

  /// POST REQUEST
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await DioClient.dio.post(path, data: data, queryParameters: query);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
