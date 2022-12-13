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

// {
// "no_faktur": "FKT/KP/2022/00000362",
// "sales_name": "KP",
// "invoice_date": "2022-10-10T17:00:00.000Z",
// "check_faktur": 1,
// "deskripsi": null,
// "cust_id": "30120500",
// "cust_name": "SEKRETARIAT DITJEN KEFARMASIAN DAN ALAT KESEHATAN",
// "addr": "JL.HR.RASUNA SAID BLOK X5 KAV.NO.4-0 KUNINGAN TIMUR SETIABUDI JAKARTA SELATAN",
// "f_loper_name": "HADLINA R",
// "finish_faktur": null
// },

@JsonSerializable()
class DetailFaktur{
  String sales_name;
  DateTime? invoice_date;
  int check_faktur;
  String? deskripsi;
  String cust_id;
  String cust_name;
  String addr;
  String loper_name;
  DateTime? finish_faktur;

  DetailFaktur({
    required this.sales_name,
    required this.invoice_date,
    required this.check_faktur,
    required this.deskripsi,
    required this.cust_id,
    required this.cust_name,
    required this.addr,
    required this.loper_name,
    required this.finish_faktur
  });

  factory DetailFaktur.fromJson(Map<String,dynamic> json) => _$DetailFakturFromJson(json);
}

@JsonSerializable()
class DetailFakturResponse{
  String message;
  List<DetailFaktur> result ;

  DetailFakturResponse(this.message, this.result);

  factory DetailFakturResponse.fromJson(Map<String,dynamic> json) => _$DetailFakturResponseFromJson(json);
}

// {
// "finish_faktur": "2022-12-06 05:10:52",
// "check_faktur": 2,
// "deskripsi": "Barang diterima"
// }

@JsonSerializable()
class UpdateFinishTime{
  String finish_faktur;
  int check_faktur;
  String deskripsi;

  UpdateFinishTime({
    required this.finish_faktur,
    required this.check_faktur,
    required this.deskripsi
  });

  factory UpdateFinishTime.fromJson(Map<String,dynamic> json) => _$UpdateFinishTimeFromJson(json);
}

@JsonSerializable()
class UpdateFinishTimeResponse{
  String message;

  UpdateFinishTimeResponse(this.message);

  factory UpdateFinishTimeResponse.fromJson(Map<String,dynamic> json) => _$UpdateFinishTimeResponseFromJson(json);
}