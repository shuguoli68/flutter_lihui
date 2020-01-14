
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/diary_detail_contract.dart';
import 'package:flutter_lihui/http/api_service.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';
import 'package:flutter_lihui/model/DiaryDetailModel.dart';

import '../entity_factory.dart';

class DiaryDetailPresenter extends BasePresenter<IDiaryDetailView> {

  IDiaryDetailModel mModel;
  ///可调用mView、mModel
  DiaryDetailPresenter() {
    mModel = DiaryDetailModel();
  }

  getDiaryDetail(String diaryId){
    if (!isViewAttached()) {
      print("HomePresenter isViewAttached false");
      return;
    }
    ApiService.queryDiary(diaryId).then((response){
      DiaryEntity bean = EntityFactory.generateOBJ<DiaryEntity>(response.data);
      if(bean.code == 200) {
        mView.onDiaryDetail(bean);
      }else{
        mView.onFail(bean.msg);
      }
    });
  }
}
