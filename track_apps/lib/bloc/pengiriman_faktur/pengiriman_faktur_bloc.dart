import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../data_source/repository/pengiriman_faktur_repository.dart';
import 'pengiriman_faktur_state.dart';
import 'pengiriman_faktur_event.dart';
import 'pengiriman_faktur_bloc.dart';

export 'pengiriman_faktur_state.dart';
export 'pengiriman_faktur_event.dart';
export 'pengiriman_faktur_bloc.dart';

class PengirimanFakturBloc extends Bloc<PengirimanFakturEvent, PengirimanFakturBlocState> {
  final PengirimanFakturRepository _pengirimanFakturRepository;
  final SharedPreferences _sharedPreferences;

  static create(PengirimanFakturRepository pengirimanFakturRepository, SharedPreferences sharedPreferences) => PengirimanFakturBloc._(pengirimanFakturRepository, sharedPreferences);

  PengirimanFakturBloc._(this._pengirimanFakturRepository, this._sharedPreferences);

  @override
  PengirimanFakturBlocState get initialState => InitialPengirimanFakturBlocState();

  @override
  Stream<PengirimanFakturBlocState> mapEventToState(PengirimanFakturEvent event) async* {
    if(event is GetPengirimanFakturEvent) {
      yield* _mapToGetPengirimanFakturEvent(event);
    }
    if(event is GetDetailFakturEvent) {
      yield* _mapToGetDetailFakturEvent(event);
    }
    if(event is UpdateFinishTimeEvent) {
      yield* _mapToUpdateFinishTime(event);
    }
    if(event is GetRekapEvent) {
      yield* _mapToGetRekapEvent(event);
    }
  }

  Stream<PengirimanFakturBlocState> _mapToGetPengirimanFakturEvent(GetPengirimanFakturEvent e) async* {
    yield LoadingPengirimanFakturState();
    final token =  _sharedPreferences.getString("access_token");
    try{
      final response = await _pengirimanFakturRepository.getPengirimanFaktur("Bearer $token", e.id);
      if (response.message == "ok") {
        yield getPengirimanFakturState(response.result);
      }
    } on DioError catch(e) {
      yield FailedPengirimanFakturState();
    }
  }

  Stream<PengirimanFakturBlocState> _mapToGetDetailFakturEvent(GetDetailFakturEvent e) async* {
    yield LoadingPengirimanFakturState();
    final token =  _sharedPreferences.getString("access_token");
    try{
      final response = await _pengirimanFakturRepository.getDetailFaktur("Bearer $token", e.id, e.idLoper, e.noFaktur);
      if (response.message == "ok") {
        yield GetDetailFakturState(response.result);
      }
    } on DioError catch(e) {
      yield FailedPengirimanFakturState();
    }
  }

  Stream<PengirimanFakturBlocState> _mapToUpdateFinishTime(UpdateFinishTimeEvent e) async* {
    yield LoadingPengirimanFakturState();
    final token = _sharedPreferences.getString("access_token");
    try {
      final response = await _pengirimanFakturRepository.postFinishTime(
          "Bearer $token",
          e.id,
          e.noFaktur,
          e.finishFaktur,
          e.checkFaktur,
          e.deskripsi
      );
      if (response.message == "posted"){
        yield SuccessUpdateFinishTimeState();
      }
    } on DioError catch(e) {
      yield FailedPengirimanFakturState();
    }
  }

  Stream<PengirimanFakturBlocState> _mapToGetRekapEvent(GetRekapEvent e) async* {
    yield LoadingPengirimanFakturState();
    final token =  _sharedPreferences.getString("access_token");
    try{
      final response = await _pengirimanFakturRepository.getRekap("Bearer $token", e.idLoper, e.filter);
      if (response.message == "ok") {
        yield GetRekapState(response.result);
      }
    } on DioError catch(e) {
      print(e.message);
      yield FailedPengirimanFakturState();
    }
  }
}