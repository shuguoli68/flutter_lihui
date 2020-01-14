
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/home_contract.dart';
import 'package:flutter_lihui/json_entity_model/banner_entity.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';
import 'package:flutter_lihui/json_entity_model/file_entity.dart';
import 'package:flutter_lihui/model/HomeModel.dart';
import 'package:path_provider/path_provider.dart';

import '../entity_factory.dart';
import '../http/api_service.dart';

class HomePresenter extends BasePresenter<IHomeView> {

  IHomeModel mModel;

  HomePresenter (){
    mModel = HomeModel();
  }

  getBanner() {
    if (!isViewAttached()) {
      print("HomePresenter isViewAttached false");
      return;
    }
    ApiService.banner().then((response){
      BannerEntity bean = EntityFactory.generateOBJ<BannerEntity>(response.data);
      if(bean.code == 200) {
        mView.onBanner(bean.data);
      }else{
        mView.onFail(bean.msg);
      }
    });
  }

  getTopDiary(int page, bool isRefresh) {
    if (!isViewAttached()) {
      print("HomePresenter isViewAttached false");
      return;
    }
    ApiService.diaryList(page).then((response){
      DiaryEntity bean = EntityFactory.generateOBJ<DiaryEntity>(response.data);
      mView.onDiary(bean, isRefresh);
    });
  }
  
  upload() async{
    File file = await FilePicker.getFile();
    print('上传：'+file.path);
    String fileName = file.path.split('/').last;
    ApiService.upload(fileName, file.path, (count, total){
      print('上传进度：$count, $total}');
    }).then((response){
      FileEntity bean = EntityFactory.generateOBJ<FileEntity>(response.data);
      print('上传文件：${bean.toString()}');
    });
  }

  download(String fileName) {
    _localPath.then((path){
      print('存储：$path');
      ApiService.download(fileName, path+"/"+fileName, (count, total){
        print('下载进度：$count, $total}');
      }).then((response){
        //不需要管response，直接查看下载进度
        print('下载文件：${response.data}');
      });
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

}