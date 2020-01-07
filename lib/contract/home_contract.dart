import 'package:flutter_lihui/base/base_view.dart';
import 'package:flutter_lihui/json_entity_model/banner_entity.dart';

abstract class IHomeModel {
  getBanner();
}

abstract class IHomeView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onBanner(List<BannerItem> data);
  void onFail(String e);
}