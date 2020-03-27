
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/sign_record_contract.dart';
import 'package:flutter_lihui/json_entity_model/sign_entity.dart';
import 'package:flutter_lihui/model/SignRecordModel.dart';
import 'package:flutter_lihui/http/api_service.dart';
import '../entity_factory.dart';

class SignRecordPresenter extends BasePresenter<ISignRecordView> {
///可调用mView、mModel

  ISignRecordModel mModel;

  SignRecordPresenter() {
    mModel = SignRecordModel();
  }

  getSignRecord(String userId, bool isRefresh){
      if (!isViewAttached()) {
        print("SignRecordPresenter isViewAttached false");
        return;
      }
      ApiService.signRecord(userId).then((response){
        SignEntity bean = EntityFactory.generateOBJ<SignEntity>(response.data);
        if(bean.code == 200) {
          mView.onSignRecord(bean, isRefresh);
        }else{
          mView.onFail(bean.msg);
        }
      });
    }
}