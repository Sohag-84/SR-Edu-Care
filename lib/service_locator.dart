import 'package:get_it/get_it.dart';
import 'package:sr_edu_care/core/network/api_services.dart';
import 'package:sr_edu_care/feature/authentication/auth_dependency_injection.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<ApiService>(() => ApiService());

  authDependencyInjection();
}
