import 'package:sr_edu_care/feature/home/data/datasources/course_remote_datasource.dart';
import 'package:sr_edu_care/feature/home/data/datasources/course_remote_datasource_impl.dart';
import 'package:sr_edu_care/feature/home/data/repository/course_repository_impl.dart';
import 'package:sr_edu_care/feature/home/domain/repository/course_repository.dart';
import 'package:sr_edu_care/feature/home/domain/usecases/get_course_usecase.dart';
import 'package:sr_edu_care/feature/home/presentation/bloc/course_bloc.dart';
import 'package:sr_edu_care/service_locator.dart';

void homeDependencyInjection() {
  //Datasource
  sl
    ..registerFactory<CourseRemoteDatasource>(
      () => CourseRemoteDatasourceImpl(apiService: sl.call()),
    )
    //Repository
    ..registerFactory<CourseRepository>(
      () => CourseRepositoryImpl(courseRemoteDatasource: sl.call()),
    )
    //Usecase
    ..registerFactory(() => GetCourseUsecase(courseRepository: sl.call()))
    //Bloc
    ..registerLazySingleton<CourseBloc>(
      () => CourseBloc(getCourseUsecase: sl.call()),
    );
}
