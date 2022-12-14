import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:track_apps/models/logout.dart';

import '../../utils/global.dart';

part 'logout_service.g.dart';

@RestApi(baseUrl: Global.baseURL)

abstract class LogoutService{
  static create(Dio dio) => _LogoutService(dio);

  @POST('/logout')
  Future<LogoutResponse> logout(@Header("Authorization") String authorization);
}