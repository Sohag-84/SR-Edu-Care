import 'package:sr_edu_care/core/network/api_endpoints.dart';
import 'package:sr_edu_care/core/network/api_services.dart';
import 'package:sr_edu_care/feature/home/data/datasource/home_remote_datasource.dart';
import 'package:sr_edu_care/feature/home/data/model/slider_model.dart';

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiService apiService;
  const HomeRemoteDatasourceImpl({required this.apiService});

  @override
  Future<List<SliderModel>> getSliders() async {
    final response = await apiService.get(ApiEndpoints.sliderList);
    List<dynamic> sliderList = response.data["data"];

    return sliderList.map((slider) => SliderModel.fromJson(slider)).toList();
  }
}
