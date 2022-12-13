import 'package:track_apps/data_source/network/tracking_loper_service.dart';

import '../../models/trackingLoper.dart';

class TrackingLoperRepository {
  final TrackingLoperService trackingLoperService;

  TrackingLoperRepository(this.trackingLoperService);

  Future<TrackingLoperResponse> getTrackingLoper(String token, String id) async {
    final response = await trackingLoperService.getTrackingLoper(token, id);
    return response;
  }

  Future<TrackingLoperResponse> getHistoryLoper(String token, String id) async {
    final response = await trackingLoperService.getHistoryLoper(token, id);
    return response;
  }
}