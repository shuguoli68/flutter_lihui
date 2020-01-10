
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/send_contract.dart';
import 'package:flutter_lihui/http/api_service.dart';
import 'package:flutter_lihui/json_entity_model/common_bool_entity.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';
import 'package:flutter_lihui/model/SendModel.dart';

import '../entity_factory.dart';

class SendPresenter extends BasePresenter<ISendView> {

  ISendModel mModel;

  SendPresenter() {
    mModel = SendModel();
  }

  sendDiary(DiaryItem item){
    ApiService.addDiary(item).then((response){
      CommonBoolEntity bean = EntityFactory.generateOBJ<CommonBoolEntity>(response.data);
      if(bean.code == 200) {
        mView.onSend(bean, true);
      }else{
        mView.onFail(bean.msg);
      }
    });
  }
}