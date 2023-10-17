// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LoginApi implements LoginApi {
  _LoginApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://his.dev.honghunghospital.com.vn/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponse> login(
    String username,
    String password,
    String deviceid,
    String token,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'username': username,
      'password': password,
      'deviceid': deviceid,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/dkkb/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<QuocgiaResponse> getListQuocGia(
    String encrypt,
    String allStatus,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'encrypt': encrypt,
      'allStatus': allStatus,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<QuocgiaResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/quocgia/GetListQuocGia',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = QuocgiaResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TinhThanhResponse> getListTinhThanh(
    String ma,
    String encrypt,
    String allStatus,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'ID': ma,
      'encrypt': encrypt,
      'allStatus': allStatus,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<TinhThanhResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/tinhthanh/GetListTinhThanhByQuocGiaAPI',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = TinhThanhResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HuyenThiResponse> getListHuyenThi(
    String ma,
    String encrypt,
    String allStatus,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'ID': ma,
      'encrypt': encrypt,
      'allStatus': allStatus,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HuyenThiResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/huyenthi/GetListHuyenThiByTinhThanhAPI',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = HuyenThiResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PhuongXaResponse> getListPhuongXa(
    String ma,
    String encrypt,
    String allStatus,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'ID': ma,
      'encrypt': encrypt,
      'allStatus': allStatus,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PhuongXaResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/phuongxa/GetListPhuongXaByHuyenThiAPI',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PhuongXaResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DanTocResponse> getListDanToc(
    String encrypt,
    String allStatus,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'encrypt': encrypt,
      'allStatus': allStatus,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DanTocResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/dantoc/GetListDanToc',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = DanTocResponse.fromJson(_result.data!);
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
