// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loper _$LoperFromJson(Map<String, dynamic> json) => Loper(
      nik: json['nik'] as String,
      branch_id: json['branch_id'] as String,
      nama_loper: json['nama_loper'] as String,
      status_kerja: json['status_kerja'] as String,
    );

Map<String, dynamic> _$LoperToJson(Loper instance) => <String, dynamic>{
      'nik': instance.nik,
      'branch_id': instance.branch_id,
      'nama_loper': instance.nama_loper,
      'status_kerja': instance.status_kerja,
    };

LoperResponse _$LoperResponseFromJson(Map<String, dynamic> json) =>
    LoperResponse(
      json['message'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => Loper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoperResponseToJson(LoperResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };
