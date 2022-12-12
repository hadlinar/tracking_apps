import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../data_source/repository/logout_repository.dart';
import '../../data_source/repository/user_repository.dart';
import 'user_state.dart';
import 'user_event.dart';
import 'user_bloc.dart';

export 'user_state.dart';
export 'user_event.dart';
export 'user_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserBlocState> {
  final UserRepository _userRepository;
  final SharedPreferences _sharedPreferences;

  static create(UserRepository userRepository, SharedPreferences sharedPreferences) => UserBloc._(userRepository, sharedPreferences);

  UserBloc._(this._userRepository, this._sharedPreferences);

  @override
  UserBlocState get initialState => InitialUserBlocState();

  @override
  Stream<UserBlocState> mapEventToState(UserEvent event) async* {
    if(event is GetUserEvent) {
      yield* _mapToGetUserEvent(event);
    }
  }

  Stream<UserBlocState> _mapToGetUserEvent(GetUserEvent e) async* {
    // yield LoadingUserState();
    final token = _sharedPreferences.getString("access_token");
    try{
      final response = await _userRepository.getUser("Bearer $token");
      if (response.message == "ok") {
        yield GetUserState(response.result);
      }
    } on DioError catch(e) {
      if(e.response?.statusCode == 500) {
        yield NotLoggedInState();
      }
      else {
        yield FailedUserState();
      }
    }
  }
}