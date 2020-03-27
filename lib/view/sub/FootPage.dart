
import 'package:flutter/material.dart';
import 'package:flutter_lihui/base/base_state.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/contract/foot_contract.dart';
import 'package:flutter_lihui/json_entity_model/foot_entity.dart';
import 'package:flutter_lihui/presenter/FootPresenter.dart';
import 'package:flutter_lihui/view/common/app_bar.dart';
import 'package:zeking_refresh/zeking_refresh.dart';

class FootPage extends StatefulWidget {

  ///跳转至该页面
  static dynamic goTo(BuildContext context, int id) async{
    return await Navigator.pushNamed(context, '/FootPage',arguments: id);
  }

  @override
  State<StatefulWidget> createState() => _FootPage();
}

class _FootPage extends BaseState<FootPage, FootPresenter> implements IFootView {

  ZekingRefreshController _refreshController;
  List<FootItem> datas = List();
  int footFan = 0;//0=浏览，1=足迹

  @override
  void initStat() {
    mPresenter = new FootPresenter();
    mPresenter.attachView(this);
    _refreshController = ZekingRefreshController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().simAppBar(footFan==0?'浏览':'足迹'),
      body: _body(),
    );
  }

  _body(){
    if(datas.isEmpty){
      setState(() {
        footFan = ModalRoute.of(context).settings.arguments;
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
            return _footWidget(index);
          },
          itemCount: datas.length,
        ),
      );
    }
  }

  onRefresh() {
    _foot(true);
  }

  onLoading() {
    _foot(false);
  }

  _foot(bool isRefresh){
    if(isRefresh) {
      datas.clear();
    }
    mPresenter.getFoot(MyConfig.userId,footFan, isRefresh);
  }

  @override
  void dispos() {
    _refreshController.dispose();
  }

  @override
  void onFoot(FootEntity entity, bool isRefresh) {
    if(entity.code == 200){//成功
      List<FootItem> mData = entity.data;
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
    print('FootPage失败：'+e);
  }

  @override
  void hideLoading() {

  }

  @override
  void showLoading() {

  }

  Widget _footWidget(int index) {
    FootItem item = datas[index];
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
              Expanded(flex:1, child: Text(footFan==0?item.toUserId:item.userId,style: TextStyle(color: Colors.black54),)),
              Expanded(flex:1, child: Text('${strTime(item.strTime)}',style: TextStyle(color: Colors.black54),)),
            ],)
          ],
        ),
      ),),
    );
  }
}