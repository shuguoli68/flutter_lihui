import 'package:flutter/material.dart';
import 'package:flutter_lihui/json_entity_model/common_bool_entity.dart';
import '../entity_factory.dart';
import '../http/api_service.dart';
import 'my_public.dart';
import 'package:flutter_lihui/view/sub/login.dart';

class MyRequest {
  static final MyRequest _myRequest = MyRequest();
  factory MyRequest(){

  }

  logout(BuildContext context){
    SPKey.spGetStr(SPKey.USER_NAME).then((value){
      ApiService.logout(value).then((response){
        CommonBoolEntity bean = EntityFactory.generateOBJ<CommonBoolEntity>(response.data);
        if(bean.code == 200) {
          SPKey.spSetBool(SPKey.IS_LOGIN, false);
          SPKey.spSetStr(SPKey.USER_NAME, "");
          SPKey.spSetStr(SPKey.PASS_WORD, "");
          MyConfig.userId = "";
          goToRm(context, Login());
        }else{
          myToast(bean.msg);
        }
      });
    });
  }
}