
import 'dart:io';

import 'package:dio/dio.dart';

import 'api.dart';
import 'http_util.dart';
import 'dart:convert' as convert;

class ApiService{

  static Map<String, String> _headerMap;

  static Map<String, String> _getHeader() {
    if (null == _headerMap) {
      _headerMap = Map();
      _headerMap["Cookie"] = "";//MyConfig.cookie;
    }
    return _headerMap;
  }

  static Future<Response> base(String url, {Map<String, dynamic> req})async{
    var data = convert.jsonEncode(req);
    var response = await HttpUtils.request(
      url,
      method: HttpUtils.POST,
      data: data,
      header: _getHeader(),
    );
    return response;
  }

  ///
  ///登录
  ///
  static Future<Response> login(String username, String password)async{
    Map<String, dynamic> req = {
      'userId':username,
      'passWord':password
    };
    return base(Api.login, req:req);
  }

  ///
  ///注册
  ///
  static Future<Response> register(String username, String password)async{
    Map<String, dynamic> req = {
      'userId':username,
      'passWord':password
    };
    return base(Api.register, req:req);
  }

  ///
  ///退出登录
  ///
  static Future<Response> logout(String username)async{
    Map<String, dynamic> req = {
      'userId':username
    };
    return base(Api.logout, req:req);
  }



}