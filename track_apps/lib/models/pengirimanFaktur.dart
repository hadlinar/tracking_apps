import 'package:json_annotation/json_annotation.dart';

import 'package:track_apps/models/pengirimanFaktur.dart';
part 'pengirimanFaktur.g.dart';

//     {
// "message": "ok",
// {
// "no_faktur": "FKT/KP/2022/00000362",
// "start_faktur": "2022-12-05T19:09:26.000Z",
// "finish_faktur": null,
// "check_faktur": 1,
// "deskripsi": null
// },

@JsonSerializable()
class PengirimanFaktur{
  String no_faktur;
  String start_faktur;
  String finish_faktur;
  String check_faktur;
  String deskripsi;

  PengirimanFaktur({
    required this.no_faktur,
    required this.start_faktur,
    required this.finish_faktur,
    required this.check_faktur,
    required this.deskripsi,
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