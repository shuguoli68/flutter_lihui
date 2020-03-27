import 'package:flutter/material.dart';
import 'package:flutter_lihui/base/base_state.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/contract/diary_detail_contract.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';
import 'package:flutter_lihui/presenter/DiaryDetailPresenter.dart';
import 'package:flutter_lihui/view/common/app_bar.dart';

class DiaryDetailPage extends StatefulWidget {

  static dynamic goTo(BuildContext context, String id) async{
    return await Navigator.pushNamed(context, '/DiaryDetailPage',arguments: id);
  }

  @override
  State<StatefulWidget> createState() => _DiaryDetailPage();
}

class _DiaryDetailPage extends BaseState<DiaryDetailPage, DiaryDetailPresenter> implements IDiaryDetailView {

  DiaryItem _diaryItem;
  String title = 'DiaryDetail';

  @override
  void initStat() {
    mPresenter = new DiaryDetailPresenter();
    mPresenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().simAppBar(title),
      body: _body(),
    );
  }

  _body(){
    if(_diaryItem ==null){
      String diaryId = ModalRoute.of(context).settings.arguments;
      mPresenter.getDiaryDetail(diaryId);
      return Center(child: Text('数据加载中...'),);
    }else{
      return Column(children: <Widget>[
        Padding(padding: EdgeInsets.all(5.0),child: Text(_diaryItem.content),),
        Padding(padding: EdgeInsets.all(5.0),child: Text('${strTime(_diaryItem.utTime)}'),),

      ],);
    }
  }

  @override
  void dispos() {

  }

  @override
  void onDiaryDetail(DiaryEntity data) {
    if(data.data.isEmpty)
      myToast('数据为空');
    else{
      setState(() {
        _diaryItem = data.data[0];
        title = _diaryItem.title;
      });
    }
  }

  @override
  void onFail(String e) {
    print('DiaryDetailPage失败：'+e);
  }

  @override
  void hideLoading() {

  }

  @override
  void showLoading() {

  }
}