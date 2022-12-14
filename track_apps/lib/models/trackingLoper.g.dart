// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trackingLoper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingLoper _$TrackingLoperFromJson(Map<String, dynamic> json) =>
    TrackingLoper(
      id: json['id'] as int,
      id_pengiriman: json['id_pengiriman'] as String,
      id_loper: json['id_loper'] as int,
      branch_id: json['branch_id'] as String,
      start_loper: json['start_loper'] == null
          ? null
          : DateTime.parse(json['start_loper'] as String),
      finish_loper: json['finish_loper'] == null
          ? null
          : DateTime.parse(json['finish_loper'] as String),
      tanggal: json['tanggal'] == null
          ? null
          : DateTime.parse(json['tanggal'] as String),
      jumlah: json['jumlah'] as String,
    );

Map<String, dynamic> _$TrackingLoperToJson(TrackingLoper instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_pengiriman': instance.id_pengiriman,
      'id_loper': instance.id_loper,
      'branch_id': instance.branch_id,
      'start_loper': instance.start_loper?.toIso8601String(),
      'finish_loper': instance.finish_loper?.toIso8601String(),
      'tanggal': instance.tanggal?.toIso8601String(),
      'jumlah': instance.jumlah,
    };

TrackingLoperResponse _$TrackingLoperResponseFromJson(
        Map<String, dynamic> json) =>
    TrackingLoperResponse(
      json['message'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => TrackingLoper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackingLoperResponseToJson(
        TrackingLoperResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };
