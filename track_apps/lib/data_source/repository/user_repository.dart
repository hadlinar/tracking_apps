import 'package:track_apps/data_source/network/user_service.dart';

import '../../models/user.dart';

class UserRepository {
  final UserService userService;

  UserRepository(this.userService);

  Future<UserResponse> getUser(String token) async {
    final response = await userService.getUser(token);
    return response;
  }
}