import 'package:sr_edu_care/feature/course/data/datasources/course_remote_datasource.dart';
import 'package:sr_edu_care/feature/course/data/datasources/course_remote_datasource_impl.dart';
import 'package:sr_edu_care/feature/course/data/repository/course_repository_impl.dart';
import 'package:sr_edu_care/feature/course/domain/repository/course_repository.dart';
import 'package:sr_edu_care/feature/course/domain/usecases/get_course_section_usecase.dart';
import 'package:sr_edu_care/feature/course/domain/usecases/get_course_usecase.dart';
import 'package:sr_edu_care/feature/course/domain/usecases/get_instructor_courses_usecase.dart';
import 'package:sr_edu_care/feature/course/domain/usecases/update_lecture_usecase.dart';
import 'package:sr_edu_care/feature/course/presentation/bloc/course/course_bloc.dart';
import 'package:sr_edu_care/feature/course/presentation/bloc/course_section/course_section_bloc.dart';
import 'package:sr_edu_care/feature/course/presentation/bloc/instructor_course/instructor_course_bloc.dart';
import 'package:sr_edu_care/feature/course/presentation/bloc/update_lecture/update_lecture_bloc.dart';
import 'package:sr_edu_care/service_locator.dart';

void courseDependencyInjection() {
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
    ..registerFactory(
      () => GetCourseSectionUsecase(courseRepository: sl.call()),
    )
    ..registerFactory<GetInstructorCoursesUsecase>(
      () => GetInstructorCoursesUsecase(courseRepository: sl.call()),
    )
    ..registerFactory<UpdateLectureUsecase>(
      () => UpdateLectureUsecase(courseRepository: sl.call()),
    )
    //Bloc
    ..registerLazySingleton<CourseBloc>(
      () => CourseBloc(getCourseUsecase: sl.call()),
    )
    ..registerLazySingleton(
      () => CourseSectionBloc(getCourseSectionUsecase: sl.call()),
    )
    ..registerLazySingleton(
      () => InstructorCourseBloc(instructorCoursesUsecase: sl.call()),
    )
    ..registerLazySingleton(
      () => UpdateLectureBloc(updateLectureUsecase: sl.call()),
    );
}
