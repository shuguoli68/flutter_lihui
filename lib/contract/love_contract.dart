import 'package:flutter_lihui/base/base_view.dart';
import 'package:flutter_lihui/json_entity_model/love_entity.dart';

abstract class ILoveModel {
  getLove();
}

abstract class ILoveView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onLove(LoveEntity data,bool isRefresh);
  void onFail(String e);
}