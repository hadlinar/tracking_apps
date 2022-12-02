import 'package:json_annotation/json_annotation.dart';
part 'branch.g.dart';

// {
//         "id": 5,
//         "branch_id": "15",
//         "branch_name": "SURABAYA",
//         "address": "Jl. Kalimas Barat No. 35 - 37 Surabaya",
//         "flg_used": "a",
//         "initial": "SBY"
//     },

@JsonSerializable()
class Branch{
  String id;
  String branch_id;
  String branch_name;
  String address;
  String flg_used;
  String initial;

  Branch({
    required this.id,
    required this.branch_id,
    required this.branch_name,
    required this.address,
    required this.flg_used,
    required this.initial
  });

  factory Branch.fromJson(Map<String,dynamic> json) => _$BranchFromJson(json);
}

@JsonSerializable()
class BranchResponse {
  String message;
  List<Branch> result;

  BranchResponse(this.message, this.result);

  factory BranchResponse.fromJson(Map<String, dynamic> json) => _$BranchResponseFromJson(json);
}