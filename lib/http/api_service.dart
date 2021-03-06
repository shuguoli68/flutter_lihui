
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';

import 'api.dart';
import 'http_util.dart';
import 'dart:convert' as convert;

class ApiService{

  static final int pageSize = 20;
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

  static Future<Response> download(String fileName, String savePath, Function(int count, int total) fac)async{
    var response = await HttpUtils.createInstance().download(Api.baseUrl+Api.download+fileName, savePath, /*data: data,*/onReceiveProgress: (count, total){
      fac(count, total);
    });
    return response;
  }

  static Future<Response> upload(String fileName, String filePath, Function(int count, int total) fac)async{
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath, filename: fileName)
    });
    var response = await HttpUtils.createInstance().post(Api.baseUrl+Api.upload, data: data,onSendProgress: (count, total){
      fac(count, total);
    });
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

  ///
  ///获取首页banner
  ///
  static Future<Response> banner()async{
    Map<String, dynamic> req = {
      "pageNum": 0,
      "pageSize": pageSize
    };
    return base(Api.banner, req:req);
  }

  ///
  ///查询今天是否签到
  ///
  static Future<Response> querySign(String userId)async{
    Map<String, dynamic> req = {
      "userId": userId
    };
    return base(Api.querySign, req:req);
  }

  ///
  ///签到
  ///
  static Future<Response> addSign(String userId)async{
    Map<String, dynamic> req = {
      "userId": userId
    };
    return base(Api.addSign, req:req);
  }

  ///
  ///签到记录
  ///
  static Future<Response> signRecord(String userId)async{
    Map<String, dynamic> req = {
      "userId": userId
    };
    return base(Api.signRecord, req:req);
  }

  ///
  ///获取diary列表
  ///
  static Future<Response> diaryList(int page)async{
    Map<String, dynamic> req = {
      "pageNum": page,
      "pageSize": pageSize
    };
    return base(Api.diaryList, req:req);
  }

  ///
  ///获取diary列表
  ///
  static Future<Response> allTheme()async{
    Map<String, dynamic> req = {

    };
    return base(Api.allTheme, req:req);
  }

  ///
  ///添加diary
  ///
  static Future<Response> addDiary(DiaryItem item)async{
    Map<String, dynamic> req = {
      "content": item.content,
      "subTheme": item.subTheme,
      "theme": item.theme,
      "title": item.title,
      "userId": item.userId,
      "tagId":item.tagId
    };
    return base(Api.addDiary, req:req);
  }

  ///
  ///获取全部diary标签
  ///
  static Future<Response> allTag()async{
    Map<String, dynamic> req = {
      "pageNum": 1,
      "pageSize": 100
    };
    return base(Api.allTag, req:req);
  }

  ///
  ///根据id获取diary
  ///
  static Future<Response> queryDiary(String diaryId)async{
    Map<String, dynamic> req = {
      "diaryId": diaryId
    };
    return base(Api.queryDiary, req:req);
  }

  ///
  ///根据id获取关注、粉丝列表
  ///
  static Future<Response> queryLove(String userId, int loveFans)async{
    Map<String, dynamic> req = {
      "userId": userId
    };
    String url = loveFans==0?Api.queryLove:Api.queryFan;
    return base(url, req:req);
  }

  ///
  ///根据id获取浏览、足迹列表
  ///
  static Future<Response> queryFoot(String userId, int loveFans)async{
    Map<String, dynamic> req = {
      "userId": userId
    };
    String url = loveFans==0?Api.queryBrowse:Api.queryFoot;
    return base(url, req:req);
  }
}