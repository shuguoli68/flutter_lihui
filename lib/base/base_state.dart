import 'package:flutter/material.dart';

import 'base_presenter.dart';
import 'base_view.dart';

abstract class BaseState<C extends StatefulWidget, T extends BasePresenter> extends State<C> implements BaseView{

  T mPresenter;

  @override
  void initState() {
    super.initState();
    initStat();
    if (mPresenter != null)
      mPresenter.attachView(this);
  }

  @override
  void dispose() {
    super.dispose();
    dispos();
    if (mPresenter != null)
      mPresenter.detachView();
  }

  void initStat();
  void dispos();
}