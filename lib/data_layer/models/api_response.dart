import 'data.dart';
import 'meta_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  ApiResponse({this.status, this.statusMessage, this.data, this.meta});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
