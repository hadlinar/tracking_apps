import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PengirimanFakturEvent{}

class GetPengirimanFakturEvent extends PengirimanFakturEvent{
  String id;

  GetPengirimanFakturEvent(this.id);
}