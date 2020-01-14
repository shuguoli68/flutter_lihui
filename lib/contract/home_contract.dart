import 'package:flutter_lihui/base/base_view.dart';
import 'package:flutter_lihui/json_entity_model/banner_entity.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';

abstract class IHomeModel {
  getBanner();
}

abstract class IHomeView extends BaseView {
  @override
  void showLoading();
  @override
  void hideLoading();
  void onBanner(List<BannerItem> data);
  void onDiary(DiaryEntity data, bool isRefresh);
  void onFail(String e);
  void addSign(String userId);
  void signIn();
}