import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_lihui/http/address.dart';
import 'package:flutter_lihui/http/logs_interceptors.dart';
import 'package:flutter_lihui/http/response_interceptors.dart';
import 'package:flutter_lihui/http/result_data.dart';

class HttpManager {
  static HttpManager _instance = HttpManager._internal();
  Dio _dio;

  factory HttpManager() => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpManager._internal({String baseUrl}) {
    if (null == _dio) {
      _dio = new Dio(new BaseOptions(
          baseUrl: Address.BASE_URL_RELEASE, connectTimeout: 15000));
      _dio.interceptors.add(new LogsInterceptors());
      _dio.interceptors.add(new ResponseInterceptors());
    }
  }

  static HttpManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名，比如cdn和kline首次的http请求
  HttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  HttpManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != Address.BASE_URL_RELEASE) {
        _dio.options.baseUrl = Address.BASE_URL_RELEASE;
      }
    }
    return this;
  }

  ///通用的GET请求
  get(url, params, {noTip = false}) async {
    Response response;
    try {
      response = await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      return ResultError(e);
    }

    if (response.data is DioError) {
      return ResultError(response.data['code']);
    }

    return response.data;
  }
  ///通用的POST请求
  post(url, params, {noTip = false}) async {
    Response response;

    try {
      response = await _dio.post(url, data: params);
    } on DioError catch (e) {
      return ResultError(e);
    }

    if (response.data is DioError) {
      return ResultError(response.data['code']);
    }

    return response.data;
  }
}