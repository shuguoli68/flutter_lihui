import 'package:flutter_lihui/base/base_view.dart';

abstract class ISettingModel {
  getSetting();
}

abstract class ISettingView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onFail(String e);
}