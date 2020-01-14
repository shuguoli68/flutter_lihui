
import 'package:flutter_lihui/base/base_presenter.dart';
import 'package:flutter_lihui/contract/diary_detail_contract.dart';
import 'package:flutter_lihui/model/DiaryDetailModel.dart';

class DiaryDetailPresenter extends BasePresenter<IDiaryDetailView> {

  IDiaryDetailModel mModel;
  ///可调用mView、mModel
  DiaryDetailPresenter() {
    mModel = DiaryDetailModel();
  }

  getDetail(){

  }
}
