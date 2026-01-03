import 'package:sr_edu_care/feature/home/data/model/slider_model.dart';

abstract interface class HomeRemoteDatasource {
  Future<List<SliderModel>> getSliders();
}
