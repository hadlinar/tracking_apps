import 'package:json_annotation/json_annotation.dart';

import 'package:track_apps/models/loper.dart';
part 'loper.g.dart';

// {
// "message": "ok",
// "result": {
// "id": 3,
// "nik": "2016458002",
// "branch": "AMBON",
// "nama_loper": "SUPARDI ARSAD",
// "status_kerja": 0
// }
// }

@JsonSerializable()
class Loper{
  int id;
  String nik;
  String branch;
  String nama_loper;
  int status_kerja;

  Loper({
    required this.id,
    required this.nik,
    required this.branch,
    required this.nama_loper,
    required this.status_kerja
  });

  factory Loper.fromJson(Map<String,dynamic> json) => _$LoperFromJson(json);
}

@JsonSerializable()
class LoperResponse{
  String message;
  Loper result;

  LoperResponse(this.message, this.result);

  factory LoperResponse.fromJson(Map<String,dynamic> json) => _$LoperResponseFromJson(json);
}