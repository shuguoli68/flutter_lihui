import 'package:flutter_lihui/base/base_view.dart';
import 'package:flutter_lihui/json_entity_model/common_bool_entity.dart';

abstract class ISendModel {
  sendDiary();
}

abstract class ISendView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onSend(CommonBoolEntity data, bool isRefresh);
  void onFail(String e);
}