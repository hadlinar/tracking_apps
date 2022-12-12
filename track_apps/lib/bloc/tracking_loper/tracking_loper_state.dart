import 'package:meta/meta.dart';

import '../../models/trackingLoper.dart';

@immutable
abstract class TrackingLoperBlocState{}

class InitialTrackingLoperBlocState extends TrackingLoperBlocState{}

class LoadingTrackingLoperState extends TrackingLoperBlocState {}

class SuccessTrackingLoperState extends TrackingLoperBlocState {}

class FailedTrackingLoperState extends TrackingLoperBlocState{}

class NotLoggedInState extends TrackingLoperBlocState{}

class GetTrackingLoperState extends TrackingLoperBlocState{
  List<TrackingLoper> getTrackingLoper;

  GetTrackingLoperState(this.getTrackingLoper);
}