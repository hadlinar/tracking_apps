// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengiriman_faktur_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PengirimanFakturService implements PengirimanFakturService {
  _PengirimanFakturService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:3001/toba';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PengirimanFakturResponse> getPengirimanFaktur(
      authorization, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PengirimanFakturResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/pengiriman-faktur/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PengirimanFakturResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DetailFakturResponse> getDetailFaktur(
      authorization, id, idLoper, noFaktur) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'noFaktur': noFaktur};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DetailFakturResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/pengiriman-faktur/${id}/${idLoper}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DetailFakturResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateFinishTimeResponse> postFinishTime(
      authorization, id, noFaktur, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'noFaktur': noFaktur};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpdateFinishTimeResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/pengiriman-faktur/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateFinishTimeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RekapResponse> getRekap(authorization, idLoper, filter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RekapResponse>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, '/pengiriman-faktur/rekap/${idLoper}/${filter}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RekapResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
