import 'package:meta/meta.dart';

@immutable
abstract class LogoutBlocState {}

class InitialLogoutBlocState extends LogoutBlocState {}

class LoadingLogoutState extends LogoutBlocState{}

class NotLoggedInState extends LogoutBlocState{}

class ServerErrorState extends LogoutBlocState{}