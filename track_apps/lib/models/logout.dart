import 'package:json_annotation/json_annotation.dart';

import 'package:track_apps/models/logout.dart';
part 'logout.g.dart';

@JsonSerializable()
class LogoutResponse{
  String message;

  LogoutResponse(this.message);

  factory LogoutResponse.fromJson(Map<String,dynamic> json) => _$LogoutResponseFromJson(json);
}