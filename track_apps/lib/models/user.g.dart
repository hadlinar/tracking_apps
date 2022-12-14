// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      username: json['username'] as String,
      role_id: json['role_id'] as int,
      branch_id: json['branch_id'] as String,
      branch: json['branch'] as String,
      is_active: json['is_active'] as int,
      nama: json['nama'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role_id': instance.role_id,
      'branch_id': instance.branch_id,
      'branch': instance.branch,
      'is_active': instance.is_active,
      'nama': instance.nama,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['message'] as String,
      User.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };
