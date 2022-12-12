import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../data_source/repository/logout_repository.dart';
import '../../data_source/repository/loper_repository.dart';
import 'loper_state.dart';
import 'loper_event.dart';
import 'loper_bloc.dart';

export 'loper_state.dart';
export 'loper_event.dart';
export 'loper_bloc.dart';

class LoperBloc extends Bloc<LoperEvent, LoperBlocState> {
  final LoperRepository _loperRepository;
  final LogoutRepository _logoutRepository;
  final SharedPreferences _sharedPreferences;

  static create(LoperRepository loperRepository, LogoutRepository logoutRepository, SharedPreferences sharedPreferences) => LoperBloc._(loperRepository, logoutRepository, sharedPreferences);

  LoperBloc._(this._loperRepository, this._logoutRepository, this._sharedPreferences);

  @override
  LoperBlocState get initialState => InitialLoperBlocState();

  @override
  Stream<LoperBlocState> mapEventToState(LoperEvent event) async* {
    if(event is GetLoperEvent) {
      yield* _mapToGetLoperEvent(event);
    }
    if(event is LogoutEvent) {
      yield* _mapToLogoutEvent(event);
    }
  }

  Stream<LoperBlocState> _mapToGetLoperEvent(GetLoperEvent e) async* {
    final token = _sharedPreferences.getString("access_token");
    try{
      final response = await _loperRepository.getLoper("Bearer $token");
      if (response.message == "ok") {
        yield GetLoperState(response.result);
      }
    } on DioError catch(e) {
      if(e.response?.statusCode == 500) {
        yield FailedLoperState();
      } else {
        yield FailedLoperState();
      }
    }
  }

  Stream<LoperBlocState> _mapToLogoutEvent(LogoutEvent e) async* {
    yield LoadingLogoutState();
    final token = _sharedPreferences.getString("access_token");
    try {
      final response = await _logoutRepository.logout("Bearer $token");
      if(response.message == "Logged out") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove("access_token");
        yield NotLoggedInState();
      }
    } on DioError catch (e) {
      if(e.response?.statusCode == 400){
        yield NotLoggedInState();
      }
      yield ServerErrorState();
    }
  }
}