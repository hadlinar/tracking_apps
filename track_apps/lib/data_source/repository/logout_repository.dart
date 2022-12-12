import '../../models/logout.dart';
import '../network/logout_service.dart';

class LogoutRepository {
  final LogoutService logoutService;

  LogoutRepository(this.logoutService);

  Future<LogoutResponse> logout(String token) async {
    final response = await logoutService.logout(token);
    return response;
  }

}