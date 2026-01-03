import 'package:sr_edu_care/feature/home/data/datasource/home_remote_datasource.dart';
import 'package:sr_edu_care/feature/home/data/datasource/home_remote_datasource_impl.dart';
import 'package:sr_edu_care/feature/home/data/repository/home_repository_impl.dart';
import 'package:sr_edu_care/feature/home/domain/repository/home_repository.dart';
import 'package:sr_edu_care/feature/home/domain/usecases/get_slider_usecase.dart';
import 'package:sr_edu_care/feature/home/presentation/bloc/slider_bloc.dart';
import 'package:sr_edu_care/service_locator.dart';

void homeDependencyInjection() {
  //Datasource
  sl
    ..registerFactory<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(apiService: sl.call()),
    )
    //Repository
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDatasource: sl.call()),
    )
    //Usecase
    ..registerFactory(() => GetSliderUsecase(homeRepository: sl.call()))
    //Bloc
    ..registerLazySingleton<SliderBloc>(
      () => SliderBloc(sliderUsecase: sl.call()),
    );
}
