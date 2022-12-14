import 'package:json_annotation/json_annotation.dart';

import 'package:track_apps/models/user.dart';
part 'user.g.dart';


// {
// "message": "ok",
// "result": {
// "id": 3,
//         "username": "2016458002",
//         "role_id": 2,
//         "branch_id": "58",
//         "branch": "AMBON",
//         "is_active": 1,
//         "nama": "SUPARDI ARSAD"
// }
// }

@JsonSerializable()
class User{
  int id;
  String username;
  int role_id;
  String branch_id;
  String branch;
  int is_active;
  String nama;

  User({
    required this.id,
    required this.username,
    required this.role_id,
    required this.branch_id,
    required this.branch,
    required this.is_active,
    required this.nama
  });

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class UserResponse{
  String message;
  User result;

  UserResponse(this.message, this.result);

  factory UserResponse.fromJson(Map<String,dynamic> json) => _$UserResponseFromJson(json);
}