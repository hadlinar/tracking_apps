import '../../models/loper.dart';
import '../network/loper_service.dart';

class LoperRepository {
  final LoperService loperService;

  LoperRepository(this.loperService);

  Future<LoperResponse> getLoper(String token) async {
    final response = await loperService.getLoper(token);
    return response;
  }
}