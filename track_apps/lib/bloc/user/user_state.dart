import 'package:meta/meta.dart';
import 'package:track_apps/models/user.dart';

@immutable
abstract class UserBlocState{}

class InitialUserBlocState extends UserBlocState{}

class LoadingUserState extends UserBlocState{}

class SuccessUserState extends UserBlocState{}

class FailedUserState extends UserBlocState{}

class NotLoggedInState extends UserBlocState{}

class ServerErrorState extends UserBlocState{}

class GetUserState extends UserBlocState{
  User getUser;

  GetUserState(this.getUser);
}