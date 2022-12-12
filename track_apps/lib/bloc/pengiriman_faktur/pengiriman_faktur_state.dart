import 'package:meta/meta.dart';

import '../../models/pengirimanFaktur.dart';

@immutable
abstract class PengirimanFakturBlocState{}

class InitialPengirimanFakturBlocState extends PengirimanFakturBlocState{}

class LoadingPengirimanFakturState extends PengirimanFakturBlocState {}

class SuccessPengirimanFakturState extends PengirimanFakturBlocState {}

class FailedPengirimanFakturState extends PengirimanFakturBlocState{}

class NotLoggedInState extends PengirimanFakturBlocState{}

class getPengirimanFakturState extends PengirimanFakturBlocState{
  List<PengirimanFaktur> getPengirimanFaktur;

  getPengirimanFakturState(this.getPengirimanFaktur);
}