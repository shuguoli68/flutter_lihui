
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/register_contract.dart';
import 'package:flutter_lihui/json_entity_model/common_bool_entity.dart';
import 'package:flutter_lihui/model/RegisterModel.dart';
import 'package:flutter_lihui/common/my_public.dart';

import '../entity_factory.dart';
import '../http/api_service.dart';

class RegisterPresenter extends BasePresenter<IRegisterView> {

  IRegisterModel mModel;

  RegisterPresenter (){
    mModel = RegisterModel();
  }

  register(String userId, String passWord) {
    if (!isViewAttached()) {
      print("RegisterPresenter isViewAttached false");
      return;
    }
    ApiService.register(userId, passWord).then((response){
      CommonBoolEntity bean = EntityFactory.generateOBJ<CommonBoolEntity>(response.data);
      if(bean.code == 200) {
        SPKey.spSetBool(SPKey.IS_LOGIN, true);
        mView.onSuccess();
      }else{
        mView.onFail(bean.msg);
      }
    });
  }

}