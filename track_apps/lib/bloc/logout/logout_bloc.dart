import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data_source/repository/logout_repository.dart';
import 'logout_state.dart';
import 'logout_event.dart';
import 'logout_bloc.dart';

export 'logout_state.dart';
export 'logout_event.dart';
export 'logout_bloc.dart';

class LogoutBloc extends Bloc<LogoutBlocEvent, LogoutBlocState> {
  final LogoutRepository _logoutRepository;
  final SharedPreferences _sharedPreferences;

  static create(LogoutRepository logoutRepository, SharedPreferences sharedPreferences) => LogoutBloc._(logoutRepository, sharedPreferences);

  LogoutBloc._(this._logoutRepository, this._sharedPreferences);

  @override
  LogoutBlocState get initialState => InitialLogoutBlocState();

  @override
  Stream<LogoutBlocState> mapEventToState(LogoutBlocEvent event) async* {
    if(event is LogoutEvent) {
      yield* _logoutToState(event);
    }

  }

  Stream<LogoutBlocState> _logoutToState(LogoutEvent e) async* {
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