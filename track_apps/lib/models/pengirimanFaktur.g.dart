// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengirimanFaktur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PengirimanFaktur _$PengirimanFakturFromJson(Map<String, dynamic> json) =>
    PengirimanFaktur(
      no_faktur: json['no_faktur'] as String,
      start_faktur: json['start_faktur'] == null
          ? null
          : DateTime.parse(json['start_faktur'] as String),
      finish_faktur: json['finish_faktur'] == null
          ? null
          : DateTime.parse(json['finish_faktur'] as String),
      check_faktur: json['check_faktur'] as int,
      deskripsi: json['deskripsi'] as String,
      cust_id: json['cust_id'] as String,
      cust_name: json['cust_name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$PengirimanFakturToJson(PengirimanFaktur instance) =>
    <String, dynamic>{
      'no_faktur': instance.no_faktur,
      'start_faktur': instance.start_faktur?.toIso8601String(),
      'finish_faktur': instance.finish_faktur?.toIso8601String(),
      'check_faktur': instance.check_faktur,
      'deskripsi': instance.deskripsi,
      'cust_id': instance.cust_id,
      'cust_name': instance.cust_name,
      'address': instance.address,
    };

PengirimanFakturResponse _$PengirimanFakturResponseFromJson(
        Map<String, dynamic> json) =>
    PengirimanFakturResponse(
      json['message'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => PengirimanFaktur.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PengirimanFakturResponseToJson(
        PengirimanFakturResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };

DetailFaktur _$DetailFakturFromJson(Map<String, dynamic> json) => DetailFaktur(
      sales_name: json['sales_name'] as String,
      invoice_date: json['invoice_date'] == null
          ? null
          : DateTime.parse(json['invoice_date'] as String),
      check_faktur: json['check_faktur'] as int,
      deskripsi: json['deskripsi'] as String?,
      cust_id: json['cust_id'] as String,
      cust_name: json['cust_name'] as String,
      addr: json['addr'] as String,
      loper_name: json['loper_name'] as String,
      finish_faktur: json['finish_faktur'] == null
          ? null
          : DateTime.parse(json['finish_faktur'] as String),
    );

Map<String, dynamic> _$DetailFakturToJson(DetailFaktur instance) =>
    <String, dynamic>{
      'sales_name': instance.sales_name,
      'invoice_date': instance.invoice_date?.toIso8601String(),
      'check_faktur': instance.check_faktur,
      'deskripsi': instance.deskripsi,
      'cust_id': instance.cust_id,
      'cust_name': instance.cust_name,
      'addr': instance.addr,
      'loper_name': instance.loper_name,
      'finish_faktur': instance.finish_faktur?.toIso8601String(),
    };

DetailFakturResponse _$DetailFakturResponseFromJson(
        Map<String, dynamic> json) =>
    DetailFakturResponse(
      json['message'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => DetailFaktur.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailFakturResponseToJson(
        DetailFakturResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };

UpdateFinishTime _$UpdateFinishTimeFromJson(Map<String, dynamic> json) =>
    UpdateFinishTime(
      finish_faktur: json['finish_faktur'] as String,
      check_faktur: json['check_faktur'] as int,
      deskripsi: json['deskripsi'] as String,
    );

Map<String, dynamic> _$UpdateFinishTimeToJson(UpdateFinishTime instance) =>
    <String, dynamic>{
      'finish_faktur': instance.finish_faktur,
      'check_faktur': instance.check_faktur,
      'deskripsi': instance.deskripsi,
    };

UpdateFinishTimeResponse _$UpdateFinishTimeResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateFinishTimeResponse(
      json['message'] as String,
    );

Map<String, dynamic> _$UpdateFinishTimeResponseToJson(
        UpdateFinishTimeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
