import 'package:sr_edu_care/core/entity/response_entity.dart';

class ResponseModel extends ResponseEntity {
  ResponseModel({required super.status, required super.message});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(status: json['status'], message: json['message']);
  }
}
