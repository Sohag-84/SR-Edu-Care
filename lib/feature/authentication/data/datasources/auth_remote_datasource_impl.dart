import 'package:sr_edu_care/core/model/response_model.dart';
import 'package:sr_edu_care/core/network/api_endpoints.dart';
import 'package:sr_edu_care/core/network/api_services.dart';
import 'package:sr_edu_care/feature/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:sr_edu_care/feature/authentication/data/models/auth_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiService apiService;
  const AuthRemoteDatasourceImpl({required this.apiService});

  @override
  Future<AuthModel> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    final response = await apiService.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    return AuthModel.fromJson(response.data);
  }

  @override
  Future<ResponseModel> userSingup({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    final response = await apiService.post(
      ApiEndpoints.register,
      data: {'name': name, 'email': email, 'password': password, 'role': role},
    );
    return ResponseModel.fromJson(response.data);
  }
}
