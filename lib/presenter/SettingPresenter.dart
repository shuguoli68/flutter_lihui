import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/setting_contract.dart';
import 'package:flutter_lihui/model/SettingModel.dart';
import 'package:flutter_lihui/http/api_service.dart';
import '../entity_factory.dart';

class SettingPresenter extends BasePresenter<ISettingView> {
///可调用mView、mModel

  ISettingModel mModel;

  SettingPresenter() {
    mModel = SettingModel();
  }

  getSetting(){
      if (!isViewAttached()) {
        print("SettingPresenter isViewAttached false");
        return;
      }
//      ApiService.banner().then((response){
//        SettingEntity bean = EntityFactory.generateOBJ<SettingEntity>(response.data);
//        if(bean.code == 200) {
//          mView.onSetting(bean);
//        }else{
//          mView.onFail(bean.msg);
//        }
//      });
    }
}