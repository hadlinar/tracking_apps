import 'package:meta/meta.dart';

@immutable
abstract class LoginBlocState {}

class InitialLoginBlocState extends LoginBlocState {}

class LoadingLoginState extends LoginBlocState{}

class SuccessLoginState extends LoginBlocState{}

class WrongPasswordLoginState extends LoginBlocState{}

class NotLoggedInState extends LoginBlocState{}

class ServerErrorState extends LoginBlocState{}