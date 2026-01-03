import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/home/domain/entities/slider_entity.dart';

abstract interface class HomeRepository {
  ResultFuture<List<SliderEntity>> getSliders();
}
