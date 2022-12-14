import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../data_source/repository/tracking_loper_repository.dart';
import 'tracking_loper_state.dart';
import 'tracking_loper_event.dart';
import 'tracking_loper_bloc.dart';

export 'tracking_loper_state.dart';
export 'tracking_loper_event.dart';
export 'tracking_loper_bloc.dart';

class TrackingLoperBloc extends Bloc<TrackingLoperEvent, TrackingLoperBlocState> {
  final TrackingLoperRepository _trackingLoperRepository;
  final SharedPreferences _sharedPreferences;

  static create(TrackingLoperRepository trackingLoperRepository, SharedPreferences sharedPreferences) => TrackingLoperBloc._(trackingLoperRepository, sharedPreferences);

  TrackingLoperBloc._(this._trackingLoperRepository, this._sharedPreferences);

  @override
  TrackingLoperBlocState get initialState => InitialTrackingLoperBlocState();

  @override
  Stream<TrackingLoperBlocState> mapEventToState(TrackingLoperEvent event) async* {
    if(event is GetTrackingLoperEvent) {
      yield* _mapToGetTrackingLoperEvent(event);
    }
    if(event is GetHistoryLoperEvent) {
      yield* _mapToGetHistoryLoperEvent(event);
    }
  }

  Stream<TrackingLoperBlocState> _mapToGetTrackingLoperEvent(GetTrackingLoperEvent e) async* {
    final token = _sharedPreferences.getString("access_token");
    try{
      final response = await _trackingLoperRepository.getTrackingLoper("Bearer $token", e.id);
      if (response.message == "ok") {
        yield GetTrackingLoperState(response.result);
      }
    } on DioError catch(e) {
      if(e.response?.statusCode == 500) {
        yield NotLoggedInState();
      }
      else {
        yield FailedTrackingLoperState();
      }
    }
  }

  Stream<TrackingLoperBlocState> _mapToGetHistoryLoperEvent(GetHistoryLoperEvent e) async* {
    final token = _sharedPreferences.getString("access_token");
    try{
      final response = await _trackingLoperRepository.getHistoryLoper("Bearer $token", e.id);
      if (response.message == "ok") {
        yield GetHistoryLoperState(response.result);
      }
    } on DioError catch(e) {
      if(e.response?.statusCode == 500) {
        yield NotLoggedInState();
      }
      else {
        yield FailedTrackingLoperState();
      }
    }
  }
}