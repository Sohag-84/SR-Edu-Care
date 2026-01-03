import 'package:fpdart/fpdart.dart';
import 'package:sr_edu_care/core/error_handler/api_error_handler.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/home/data/datasource/home_remote_datasource.dart';
import 'package:sr_edu_care/feature/home/domain/entities/slider_entity.dart';
import 'package:sr_edu_care/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  const HomeRepositoryImpl({required this.homeRemoteDatasource});

  @override
  ResultFuture<List<SliderEntity>> getSliders() async {
    try {
      final result = await homeRemoteDatasource.getSliders();
      return right(result);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
