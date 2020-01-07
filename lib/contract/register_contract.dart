
import 'package:flutter_lihui/base/base_view.dart';

abstract class IRegisterModel {
  register(String userId, String passWord);
}

abstract class IRegisterView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onSuccess();
  void onFail(String e);
}