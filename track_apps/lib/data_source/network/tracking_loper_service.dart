import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:track_apps/models/trackingLoper.dart';

import '../../utils/global.dart';

part 'tracking_loper_service.g.dart';

@RestApi(baseUrl: Global.baseURL)

abstract class TrackingLoperService {
  static create(Dio dio) => _TrackingLoperService(dio);

  @GET('/track-loper/{id}')
  Future<TrackingLoperResponse> getTrackingLoper(
      @Header("Authorization") String authorization, @Path('id') String filter);

  @GET('/track-loper/history/{id}')
  Future<TrackingLoperResponse> getHistoryLoper(
      @Header("Authorization") String authorization, @Path('id') String filter);
}