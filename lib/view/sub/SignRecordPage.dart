
import 'package:flutter/material.dart';
import 'package:flutter_lihui/base/base_state.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/contract/sign_record_contract.dart';
import 'package:flutter_lihui/json_entity_model/sign_entity.dart';
import 'package:flutter_lihui/presenter/SignRecordPresenter.dart';
import 'package:flutter_lihui/view/common/app_bar.dart';
import 'package:zeking_refresh/zeking_refresh.dart';

class SignRecordPage extends StatefulWidget {

  ///跳转至该页面
  static dynamic goTo(BuildContext context, String id) async{
    return await Navigator.pushNamed(context, '/SignRecordPage',arguments: id);
  }

  @override
  State<StatefulWidget> createState() => _SignRecordPage();
}

class _SignRecordPage extends BaseState<SignRecordPage, SignRecordPresenter> implements ISignRecordView {

  ZekingRefreshController _refreshController;
  List<SignItem> datas = List();

  @override
  void initStat() {
    mPresenter = new SignRecordPresenter();
    mPresenter.attachView(this);
    _refreshController = ZekingRefreshController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().simAppBar('签到记录'),
      body: _body(),
    );
  }

  _body(){
    if(datas.isEmpty){
      onRefresh();
      return Center(child: Text('数据加载中...'),);
    }else{
      return ZekingRefresh(
        controller: _refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        canLoadMore: false,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(2),
          itemBuilder: (BuildContext context, int index) {
            return _recordWidget(index);
          },
          itemCount: datas.length,
        ),
      );
    }
  }

  onRefresh() {
    _record(true);
  }

  onLoading() {
    _record(false);
  }

  _record(bool isRefresh){
    if(isRefresh) {
      datas.clear();
    }
    mPresenter.getSignRecord(MyConfig.userId, isRefresh);
  }

  @override
  void dispos() {
    _refreshController.dispose();
  }

  @override
  void onSignRecord(SignEntity entity, bool isRefresh) {
    if(entity.code == 200){//成功
      List<SignItem> mData = entity.data;
      setState(() {
        datas.addAll(mData);
//        ++page;
      });
      if(isRefresh){
        if(mData.isNotEmpty) {
          _refreshController.refreshSuccess();
          if(mData.length < 4)
            _refreshController.loadMoreSuccess();
        }
        else
          _refreshController.refreshEmpty();
      }else{
        if(mData.isNotEmpty)
          _refreshController.loadMoreSuccess();
        else
          _refreshController.loadMoreNoMore();
      }
    }else{//失败
      myToast(entity.msg);
      if(isRefresh){
        _refreshController.refreshFaild();
      }else{
        _refreshController.loadMoreFailed();
      }
    }
  }

  @override
  void onFail(String e) {
    print('SignRecordPage失败：'+e);
  }

  @override
  void hideLoading() {

  }

  @override
  void showLoading() {

  }

  Widget _recordWidget(int index) {
    SignItem item = datas[index];
    return GestureDetector(
      onTap: (){

      },
      child: Padding(padding: EdgeInsets.all(5.0),child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
//          border: Border.all(color: Colors.black12, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          children: <Widget>[
            Flex(direction: Axis.horizontal,children: <Widget>[
              Expanded(flex:1, child: Text(item.strTime,style: TextStyle(color: Colors.black54),)),
              Expanded(flex:1, child: Text('已签到',style: TextStyle(color: Colors.black54),)),
            ],)
          ],
        ),
      ),),
    );
  }
}