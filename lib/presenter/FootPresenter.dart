
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/foot_contract.dart';
import 'package:flutter_lihui/json_entity_model/foot_entity.dart';
import 'package:flutter_lihui/model/FootModel.dart';
import 'package:flutter_lihui/http/api_service.dart';
import '../entity_factory.dart';

class FootPresenter extends BasePresenter<IFootView> {
///可调用mView、mModel

  IFootModel mModel;

  FootPresenter() {
    mModel = FootModel();
  }

  getFoot(String userId, int loveFans, bool isRefresh){
      if (!isViewAttached()) {
        print("FootPresenter isViewAttached false");
        return;
      }
      ApiService.queryFoot(userId, loveFans).then((response){
        FootEntity bean = EntityFactory.generateOBJ<FootEntity>(response.data);
          mView.onFoot(bean, isRefresh);
      });
    }
}