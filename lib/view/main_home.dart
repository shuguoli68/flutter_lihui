import 'package:flutter/material.dart';
import 'package:banner/banner.dart';
import 'package:flutter_lihui/base/base_state.dart';
import 'package:flutter_lihui/contract/home_contract.dart';
import 'package:flutter_lihui/json_entity_model/banner_entity.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';
import 'package:flutter_lihui/presenter/HomePresenter.dart';
import 'package:zeking_refresh/zeking_refresh.dart';
import 'package:flutter_lihui/common/my_public.dart';

class MainHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainHme();
}

class _MainHme extends BaseState<MainHome, HomePresenter> with AutomaticKeepAliveClientMixin implements IHomeView {

  List<DiaryItem> datas = List();
  ZekingRefreshController _refreshController;
  int page = 1;
  List<BannerItem> bannerData = new List();

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initStat() {
    mPresenter = new HomePresenter();
    mPresenter.attachView(this);
    _refreshController = ZekingRefreshController();
    _refreshController.refreshingWithLoadingView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(baseBg),
      body: ZekingRefresh(
        controller: _refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(2),
          itemBuilder: (BuildContext context, int index) {
            if(index == 0){
              return Column(children: <Widget>[
                _bannerWidget(),
                _articleWidget(index),
              ],);
            }else {
              return _articleWidget(index);
            }
          },
          itemCount: datas.length,
        ),
      ),
    );
  }

  @override
  void dispos() {
    _refreshController.dispose();
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  void onBanner(List<BannerItem> data) {
    setState(() {
      bannerData = data;
    });
//    mPresenter.download(data[0].imgPath);
  }

  @override
  void onDiary(DiaryEntity entity, bool isRefresh) {
    if(entity.code == 200){//成功
      List<DiaryItem> mData = entity.data;
      setState(() {
        datas.addAll(mData);
        ++page;
      });
      if(isRefresh){
        if(mData.isNotEmpty)
          _refreshController.refreshSuccess();
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
  }

  @override
  void showLoading() {
  }

  onRefresh() {
    mPresenter.getBanner();
    _article(true);
  }

  onLoading() {
    _article(false);
  }

  _article(bool isRefresh){
    if(isRefresh) {
      page = 0;
      datas.clear();
    }
    mPresenter.getTopDiary(page, isRefresh);
  }

  _bannerWidget() {
    return Container(
      padding: EdgeInsets.all(10.0),
//      decoration: BoxDecoration(
//        border: Border.all(color: Colors.amber, width: 1),
//        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//      ),
      child: BannerView(
        data: bannerData,
        buildShowView: (index,data) {
          BannerItem item = data;
          return Flex(direction: Axis.vertical,children: <Widget>[
            Expanded(flex:1, child: Image.network(item.imgPath, width: double.infinity,fit: BoxFit.fitWidth,),),
            Container(padding:EdgeInsets.only(left: 10,right: 10),child: Flex(direction: Axis.horizontal,children: <Widget>[
              Expanded(flex:1, child: Text(item.title),),
              Text('${item.id}/${bannerData.length}'),
            ],),)
          ],);
        },
        onBannerClickListener: (index,data){
          BannerItem item = data;
//          goTo(context, WebWidget(url: item.urlPath,title: item.title,));
        },
        height: 200.0,
      ),);
  }

  Widget _articleWidget(int index) {
    DiaryItem item = datas[index];
    return GestureDetector(
      onTap: (){
//        goTo(context, WebWidget(url: item.link,title: item.chapterName,));
      },
      child: Padding(padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
//          border: Border.all(color: Colors.black12, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          children: <Widget>[
            Flex(direction: Axis.horizontal,children: <Widget>[
              ClipOval(
                child: Image.asset('images/default.png',width: 50,height: 50,fit: BoxFit.fitHeight,),
              ),
              Expanded(flex:1, child: Padding(padding: EdgeInsets.only(left: 5),child: Text(item.title, style: TextStyle(fontSize: 16),maxLines: 3,),),),

            ],),
            Padding(padding: EdgeInsets.all(3)),
            Flex(direction: Axis.horizontal,children: <Widget>[
              Expanded(flex:1, child: Text(item.userId,style: TextStyle(color: Colors.black54),)),
              Expanded(flex:1, child: Text(item.utTime.toString(),style: TextStyle(color: Colors.black54),)),
            ],)
          ],
        ),
      ),),
    );
  }

}