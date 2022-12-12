import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:track_apps/models/user.dart';

import '../../utils/global.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: Global.baseURL)

abstract class UserService{
  static create(Dio dio) => _UserService(dio);

  @GET('/user')
  Future<UserResponse> getUser(@Header("Authorization") String authorization);
}