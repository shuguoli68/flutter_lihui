import 'package:flutter/material.dart';
import 'package:flutter_lihui/base/base_state.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/contract/setting_contract.dart';
import 'package:flutter_lihui/presenter/SettingPresenter.dart';
import 'package:flutter_lihui/view/common/app_bar.dart';

class SettingPage extends StatefulWidget {

  ///跳转至该页面
  static dynamic goTo(BuildContext context, String id) async{
    return await Navigator.pushNamed(context, '/SettingPage',arguments: id);
  }

  @override
  State<StatefulWidget> createState() => _SettingPage();
}

class _SettingPage extends BaseState<SettingPage, SettingPresenter> implements ISettingView {

  @override
  void initStat() {
    mPresenter = new SettingPresenter();
    mPresenter.attachView(this);
    mPresenter.getSetting();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().simAppBar('Setting'),
      body: _body(),
    );
  }

  _body(){
    if(true){
      String diaryId = ModalRoute.of(context).settings.arguments;
      return Center(child: Text('数据加载中...'),);
    }else{
      return Column(children: <Widget>[

      ],);
    }
  }

  @override
  void dispos() {

  }

//  @override
//  void onSetting(DiaryEntity data) {
//
//  }

  @override
  void onFail(String e) {
    print('SettingPage失败：'+e);
  }

  @override
  void hideLoading() {

  }

  @override
  void showLoading() {

  }
}