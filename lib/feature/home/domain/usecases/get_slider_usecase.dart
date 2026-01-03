import 'package:sr_edu_care/core/usecase/usecase.dart';
import 'package:sr_edu_care/core/utils/typedef.dart';
import 'package:sr_edu_care/feature/home/domain/entities/slider_entity.dart';
import 'package:sr_edu_care/feature/home/domain/repository/home_repository.dart';

class GetSliderUsecase implements Usecase<List<SliderEntity>, NoParams> {
  final HomeRepository homeRepository;
  const GetSliderUsecase({required this.homeRepository});

  @override
  ResultFuture<List<SliderEntity>> call(NoParams params) async {
    return await homeRepository.getSliders();
  }
}
