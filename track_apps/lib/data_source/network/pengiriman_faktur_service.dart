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
  Future<PengirimanFakturResponse> getPengirimanFaktur(@Header("Authorization") String authorization, @Path('id') String id);

  @GET('/pengiriman-faktur/{id}/{idLoper}')
  Future<DetailFakturResponse> getDetailFaktur(
      @Header("Authorization") String authorization,
      @Path('id') String id,
      @Path('idLoper') String idLoper,
      @Query('noFaktur') String noFaktur
  );

  @POST('/pengiriman-faktur/{id}')
  Future<UpdateFinishTimeResponse> postFinishTime(
      @Header("Authorization") String authorization,
      @Path('id') String id,
      @Query('noFaktur') String noFaktur,
      @Body() Map<String,dynamic> body
    );
}