
import 'package:flutter_lihui/base/base_view.dart';
import 'package:flutter_lihui/json_entity_model/sign_entity.dart';

abstract class ISignRecordModel {
  getSignRecord();
}

abstract class ISignRecordView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onSignRecord(SignEntity data,bool isRefresh);
  void onFail(String e);
}