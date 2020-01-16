import 'package:flutter_lihui/base/base_view.dart';

abstract class ILoveModel {
  getLove();
}

abstract class ILoveView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onLove(String data);
  void onFail(String e);
}