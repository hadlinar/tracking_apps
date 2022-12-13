import 'package:json_annotation/json_annotation.dart';

import 'package:track_apps/models/trackingLoper.dart';
part 'trackingLoper.g.dart';

// {
// "id": 37,
// "id_pengiriman": "TRK-2022-KP-0018",
// "id_loper": 2,
// "branch_id": "11",
// "start_loper": "2022-12-05T19:09:26.000Z",
// "finish_loper": "2022-12-13T06:20:11.411Z",
// "tanggal": "2022-12-05T19:09:26.000Z",
// "jumlah": "3"
// },

@JsonSerializable(nullable: true)
class TrackingLoper{
  int id;
  String id_pengiriman;
  int id_loper;
  String branch_id;
  DateTime? start_loper;
  DateTime? finish_loper;
  DateTime? tanggal;
  String jumlah;

  TrackingLoper({
    required this.id,
    required this.id_pengiriman,
    required this.id_loper,
    required this.branch_id,
    required this.start_loper,
    required this.finish_loper,
    required this.tanggal,
    required this.jumlah
  });

  factory TrackingLoper.fromJson(Map<String,dynamic> json) => _$TrackingLoperFromJson(json);
}

@JsonSerializable()
class TrackingLoperResponse{
  String message;
  List<TrackingLoper> result ;

  TrackingLoperResponse(this.message, this.result);

  factory TrackingLoperResponse.fromJson(Map<String,dynamic> json) => _$TrackingLoperResponseFromJson(json);
}