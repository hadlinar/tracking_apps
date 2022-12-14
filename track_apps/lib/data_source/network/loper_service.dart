import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../models/loper.dart';
import '../../utils/global.dart';

part 'loper_service.g.dart';

@RestApi(baseUrl: Global.baseURL)

abstract class LoperService{
  static create(Dio dio) => _LoperService(dio);

  @GET('/loper')
  Future<LoperResponse> getLoper(@Header("Authorization") String authorization);
}