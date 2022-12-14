import 'package:meta/meta.dart';

import '../../models/pengirimanFaktur.dart';

@immutable
abstract class PengirimanFakturBlocState{}

class InitialPengirimanFakturBlocState extends PengirimanFakturBlocState{}

class LoadingPengirimanFakturState extends PengirimanFakturBlocState {}

class SuccessPengirimanFakturState extends PengirimanFakturBlocState {}

class FailedPengirimanFakturState extends PengirimanFakturBlocState{}

// class NotLoggedInState extends PengirimanFakturBlocState{}

class getPengirimanFakturState extends PengirimanFakturBlocState{
  List<PengirimanFaktur> getPengirimanFaktur;

  getPengirimanFakturState(this.getPengirimanFaktur);
}

class GetDetailFakturState extends PengirimanFakturBlocState{
  List<DetailFaktur> getDetailFaktur;

  GetDetailFakturState(this.getDetailFaktur);
}

class SuccessUpdateFinishTimeState extends PengirimanFakturBlocState{}

class GetRekapState extends PengirimanFakturBlocState{
  Rekap getRekap;

  GetRekapState(this.getRekap);
}