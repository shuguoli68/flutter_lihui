
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/love_contract.dart';
import 'package:flutter_lihui/http/api_service.dart';
import 'package:flutter_lihui/json_entity_model/love_entity.dart';
import 'package:flutter_lihui/model/LoveModel.dart';
import '../entity_factory.dart';

class LovePresenter extends BasePresenter<ILoveView> {
///可调用mView、mModel

  ILoveModel mModel;

  LovePresenter() {
    mModel = LoveModel();
  }

  getLove(String userId, int loveFans, bool isRefresh){
      if (!isViewAttached()) {
        print("LovePresenter isViewAttached false");
        return;
      }
      ApiService.queryLove(userId, loveFans).then((response){
        LoveEntity bean = EntityFactory.generateOBJ<LoveEntity>(response.data);
        mView.onLove(bean, isRefresh);
      });
    }
}