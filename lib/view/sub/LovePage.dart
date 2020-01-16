
import 'package:flutter/material.dart';
import 'package:flutter_lihui/base/base_state.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/contract/love_contract.dart';
import 'package:flutter_lihui/json_entity_model/love_entity.dart';
import 'package:flutter_lihui/presenter/LovePresenter.dart';
import 'package:flutter_lihui/view/common/app_bar.dart';
import 'package:zeking_refresh/zeking_refresh.dart';

class LovePage extends StatefulWidget {

  ///跳转至该页面
  static dynamic goTo(BuildContext context, int id) async{
    return await Navigator.pushNamed(context, '/LovePage',arguments: id);
  }

  @override
  State<StatefulWidget> createState() => _LovePage();
}

class _LovePage extends BaseState<LovePage, LovePresenter> implements ILoveView {

  ZekingRefreshController _refreshController;
  List<LoveItem> datas = List();
  int loveFan = 0;//0=关注，1=粉丝

  @override
  void initStat() {
    mPresenter = new LovePresenter();
    mPresenter.attachView(this);
    _refreshController = ZekingRefreshController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().simAppBar(loveFan==0?'关注':'粉丝'),
      body: _body(),
    );
  }

  _body(){
    if(datas.isEmpty){
      setState(() {
        loveFan = ModalRoute.of(context).settings.arguments;
      });
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
            return _loveWidget(index);
          },
          itemCount: datas.length,
        ),
      );
    }
  }

  onRefresh() {
    _love(true);
  }

  onLoading() {
    _love(false);
  }

  _love(bool isRefresh){
    if(isRefresh) {
      datas.clear();
    }
    mPresenter.getLove(MyConfig.userId,loveFan, isRefresh);
  }

  @override
  void dispos() {
    _refreshController.dispose();
  }

  @override
  void onLove(LoveEntity entity, bool isRefresh) {
    if(entity.code == 200){//成功
      List<LoveItem> mData = entity.data;
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
    print('LovePage失败：'+e);
  }

  @override
  void hideLoading() {

  }

  @override
  void showLoading() {

  }

  Widget _loveWidget(int index) {
    LoveItem item = datas[index];
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
              Expanded(flex:1, child: Text(loveFan==0?item.toUserId:item.userId,style: TextStyle(color: Colors.black54),)),
              Expanded(flex:1, child: Text('${strTime(item.utTime)}',style: TextStyle(color: Colors.black54),)),
            ],)
          ],
        ),
      ),),
    );
  }
}