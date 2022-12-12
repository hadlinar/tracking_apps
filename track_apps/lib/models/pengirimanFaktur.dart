import 'package:json_annotation/json_annotation.dart';

import 'package:track_apps/models/pengirimanFaktur.dart';
part 'pengirimanFaktur.g.dart';

// {
// "no_faktur": "FKT/KP/2022/00000362",
// "start_faktur": "2022-12-05T19:09:26.000Z",
// "finish_faktur": null,
// "check_faktur": 1,
// "deskripsi": null,
// "cust_id": "30120500",
// "cust_name": "SEKRETARIAT DITJEN KEFARMASIAN DAN ALAT KESEHATAN",
// "f_cust_addr": "JL.HR.RASUNA SAID BLOK X5 KAV.NO.4-0 KUNINGAN TIMUR SETIABUDI JAKARTA SELATAN"
// },

@JsonSerializable()
class PengirimanFaktur{
  String no_faktur;
  DateTime? start_faktur;
  DateTime? finish_faktur;
  int check_faktur;
  String deskripsi;
  String cust_id;
  String cust_name;
  String address;

  PengirimanFaktur({
    required this.no_faktur,
    required this.start_faktur,
    required this.finish_faktur,
    required this.check_faktur,
    required this.deskripsi,
    required this.cust_id,
    required this.cust_name,
    required this.address
  });

  factory PengirimanFaktur.fromJson(Map<String,dynamic> json) => _$PengirimanFakturFromJson(json);
}

@JsonSerializable()
class PengirimanFakturResponse{
  String message;
  List<PengirimanFaktur> result ;

  PengirimanFakturResponse(this.message, this.result);

  factory PengirimanFakturResponse.fromJson(Map<String,dynamic> json) => _$PengirimanFakturResponseFromJson(json);
}