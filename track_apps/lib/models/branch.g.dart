// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['id'] as String,
      branch_id: json['branch_id'] as String,
      branch_name: json['branch_name'] as String,
      address: json['address'] as String,
      flg_used: json['flg_used'] as String,
      initial: json['initial'] as String,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branch_id,
      'branch_name': instance.branch_name,
      'address': instance.address,
      'flg_used': instance.flg_used,
      'initial': instance.initial,
    };

BranchResponse _$BranchResponseFromJson(Map<String, dynamic> json) =>
    BranchResponse(
      json['message'] as String,
      (json['result'] as List<dynamic>)
          .map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchResponseToJson(BranchResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };
