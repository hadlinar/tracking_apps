// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loper _$LoperFromJson(Map<String, dynamic> json) => Loper(
      id: json['id'] as int,
      nik: json['nik'] as String,
      branch: json['branch'] as String,
      nama_loper: json['nama_loper'] as String,
      status_kerja: json['status_kerja'] as int,
    );

Map<String, dynamic> _$LoperToJson(Loper instance) => <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'branch': instance.branch,
      'nama_loper': instance.nama_loper,
      'status_kerja': instance.status_kerja,
    };

LoperResponse _$LoperResponseFromJson(Map<String, dynamic> json) =>
    LoperResponse(
      json['message'] as String,
      Loper.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoperResponseToJson(LoperResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };
