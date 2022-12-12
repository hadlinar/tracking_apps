import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:track_apps/models/pengirimanFaktur.dart';

import '../../utils/global.dart';

part 'pengiriman_faktur_service.g.dart';

@RestApi(baseUrl: Global.baseURL)

abstract class PengirimanFakturService{
  static create(Dio dio) => _PengirimanFakturService(dio);

  @GET('/pengiriman-faktur/{id}')
  Future<PengirimanFakturResponse> getPengirimanFaktur(@Header("Authorization") String authorization, @Path('id') String filter);

  @POST('/pengiriman-faktur/{id}')
  Future<PengirimanFakturResponse> postPengirimanFaktur(@Header("Authorization") String authorization, @Body() Map<String,dynamic> body);
}