
import 'base_view.dart';

class BasePresenter <V extends BaseView>{
  V mView;

  /// 绑定view，在初始化initState中调用该方法
  void attachView(V view) {
    this.mView = view;
  }

  /// 解除绑定view，一般在dispose中调用
  void detachView() {
    this.mView = null;
  }

  /// View是否绑定
  bool isViewAttached() {
    return mView != null;
  }
}