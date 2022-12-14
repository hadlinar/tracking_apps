import 'package:meta/meta.dart';
import 'package:track_apps/models/loper.dart';

@immutable
abstract class LoperBlocState{}

class InitialLoperBlocState extends LoperBlocState{}

class LoadingLoperState extends LoperBlocState{}

class LoadingLogoutState extends LoperBlocState{}

class SuccessLoperState extends LoperBlocState{}

class NotLoggedInState extends LoperBlocState{}

class FailedLoperState extends LoperBlocState{}

class GetLoperState extends LoperBlocState{
  Loper getLoper;

  GetLoperState(this.getLoper);
}

class ServerErrorState extends LoperBlocState{}