
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/home_contract.dart';
import 'package:flutter_lihui/json_entity_model/banner_entity.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';
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
    print(file.path + ',${file.lastAccessedSync().toIso8601String()}');
    String fileName = file.path.split('/').last;
//    String filePath;
    ApiService.upload(fileName, file.path).then((response){
      print('上传文件：${response.data}');
    });
  }

  download(String fileName) {
    if (!isViewAttached()) {
      print("HomePresenter isViewAttached false");
      return;
    }
    _localPath.then((path){
      ApiService.download(fileName, path+"debut").then((response){
        print('下载文件：${response.data}');
      });
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

}