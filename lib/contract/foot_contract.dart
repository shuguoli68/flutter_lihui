
import 'package:flutter_lihui/base/base_view.dart';
import 'package:flutter_lihui/json_entity_model/foot_entity.dart';

abstract class IFootModel {
  getFoot();
}

abstract class IFootView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onFoot(FootEntity data, bool isRefresh);
  void onFail(String e);
}