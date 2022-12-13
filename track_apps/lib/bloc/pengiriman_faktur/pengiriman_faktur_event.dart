import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PengirimanFakturEvent{}

class GetPengirimanFakturEvent extends PengirimanFakturEvent{
  String id;

  GetPengirimanFakturEvent(this.id);
}

class GetDetailFakturEvent extends PengirimanFakturEvent{
  String id;
  String idLoper;
  String noFaktur;

  GetDetailFakturEvent(this.id, this.idLoper, this.noFaktur);
}

class UpdateFinishTimeEvent extends PengirimanFakturEvent{
  String id;
  String noFaktur;
  String finishFaktur;
  int checkFaktur;
  String deskripsi;

  UpdateFinishTimeEvent(
      this.id,
      this.noFaktur,
      this.finishFaktur,
      this.checkFaktur,
      this.deskripsi
  );
}

class GetRekapEvent extends PengirimanFakturEvent{
  String idLoper;
  String filter;

  GetRekapEvent(this.idLoper, this.filter);
}