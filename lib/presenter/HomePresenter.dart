
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/home_contract.dart';
import 'package:flutter_lihui/json_entity_model/banner_entity.dart';
import 'package:flutter_lihui/model/HomeModel.dart';

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

}