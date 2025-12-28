import 'package:dio/dio.dart';
import '../../services/local_preference_service.dart';
import 'api_endpoints.dart';

class DioClient {
  DioClient._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(_authInterceptor);

  /// AUTH INTERCEPTOR
  static final InterceptorsWrapper _authInterceptor = InterceptorsWrapper(
    onRequest: (options, handler) {
      final bool isPublicApi = ApiEndpoints.publicApis.contains(options.path);

      if (!isPublicApi) {
        final token = LocalPreferenceService.instance.getToken();

        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }

      return handler.next(options);
    },

    onResponse: (response, handler) {
      return handler.next(response);
    },

    onError: (DioException e, handler) {
      if (e.response?.statusCode == 401) {
        // Token invalid / expired
        LocalPreferenceService.instance.removeToken();
      }
      return handler.next(e);
    },
  );
}
