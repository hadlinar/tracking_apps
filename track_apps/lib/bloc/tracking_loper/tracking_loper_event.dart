import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrackingLoperEvent{}

class GetTrackingLoperEvent extends TrackingLoperEvent{
  String id;

  GetTrackingLoperEvent(this.id);
}

class GetHistoryLoperEvent extends TrackingLoperEvent{
  String id;

  GetHistoryLoperEvent(this.id);
}