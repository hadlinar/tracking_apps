import 'package:track_apps/data_source/network/pengiriman_faktur_service.dart';

import '../../models/pengirimanFaktur.dart';

class PengirimanFakturRepository {
  final PengirimanFakturService pengirimanFakturService;

  PengirimanFakturRepository(this.pengirimanFakturService);

  Future<PengirimanFakturResponse> getPengirimanFaktur(String token, String id) async {
    final response = await pengirimanFakturService.getPengirimanFaktur(token, id);
    return response;
  }

}