import 'package:track_apps/data_source/network/pengiriman_faktur_service.dart';

import '../../models/pengirimanFaktur.dart';

class PengirimanFakturRepository {
  final PengirimanFakturService pengirimanFakturService;

  PengirimanFakturRepository(this.pengirimanFakturService);

  Future<PengirimanFakturResponse> getPengirimanFaktur(String token, String id) async {
    final response = await pengirimanFakturService.getPengirimanFaktur(token, id);
    return response;
  }

  Future<DetailFakturResponse> getDetailFaktur(String token, String id, String idLoper, String noFaktur) async {
    final response = await pengirimanFakturService.getDetailFaktur(token, id, idLoper, noFaktur);
    return response;
  }

  Future<UpdateFinishTimeResponse> postFinishTime(String token, String id, String noFaktur, String finishFaktur, int checkFaktur, String deskripsi) async {
    final response = await pengirimanFakturService.postFinishTime(
        token,
        id,
        noFaktur,
        {
          "finish_faktur": finishFaktur,
          "check_faktur": checkFaktur,
          "deskripsi": deskripsi
        }
    );
    return response;
  }

  Future<RekapResponse> getRekap(String token, String idLoper, String filter) async {
    final response = await pengirimanFakturService.getRekap(token, idLoper, filter);
    return response;
  }
}