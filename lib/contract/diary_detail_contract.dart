
import 'package:flutter_lihui/base/base_view.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';

abstract class IDiaryDetailModel {
  getDiaryDetail();
}

abstract class IDiaryDetailView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onDiaryDetail(DiaryEntity data);
  void onFail(String e);
}