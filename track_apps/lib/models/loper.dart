import 'package:json_annotation/json_annotation.dart';

import 'package:track_apps/models/loper.dart';
part 'loper.g.dart';

// {
// "message": "ok",
// "result": [
// {
// "nik": "2009451002",
// "branch_id": "51",
// "nama_loper": "DIDIK RIYANTO",
// "status_kerja": 0
// },
// {
// "nik": "2021409006",
// "branch_id": "13",
// "nama_loper": "AUFAR RAFDI",
// "status_kerja": 0
// },

@JsonSerializable()
class Loper{
  String nik;
  String branch_id;
  String nama_loper;
  String status_kerja;

  Loper({
    required this.nik,
    required this.branch_id,
    required this.nama_loper,
    required this.status_kerja
  });

  factory Loper.fromJson(Map<String,dynamic> json) => _$LoperFromJson(json);
}

@JsonSerializable()
class LoperResponse{
  String message;
  List<Loper> result;

  LoperResponse(this.message, this.result);

  factory LoperResponse.fromJson(Map<String,dynamic> json) => _$LoperResponseFromJson(json);
}