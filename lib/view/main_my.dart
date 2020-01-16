import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/http/api.dart';
import 'package:flutter_lihui/json_entity_model/login_entity.dart';

import 'sub/LovePage.dart';
import 'sub/SettingPage.dart';

class MainMy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainMy();
}

class _MainMy extends State<MainMy> with AutomaticKeepAliveClientMixin{

  LoginData user;


  @override
  void initState() {
    super.initState();
    user = MyConfig.user;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(baseBg),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            _headView(),
            _centerView(),
            _bottomView()
          ],),
        ),
      ),
    );
  }

  _headView() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10.0),
      color: Theme.of(context).primaryColor,
      child: Column(children: <Widget>[
        Flex(direction: Axis.horizontal,children: <Widget>[
          ClipOval(
            child: FadeInImage.assetNetwork(placeholder:'images/img.png',image: Api.fileUrl+'enjoy.png', width: 50,height: 50,fit: BoxFit.fitHeight,),
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          Column(mainAxisAlignment:MainAxisAlignment.start,children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 5),child: Text(user.name, textAlign: TextAlign.left),),
            Padding(padding: EdgeInsets.only(left: 5),child: Text(user.userId, textAlign: TextAlign.left),),
          ],),
          Expanded(flex:1, child: Container()),
          IconButton(icon: Icon(Icons.settings), onPressed: (){ SettingPage.goTo(context, ''); })
        ],),
        Padding(padding: EdgeInsets.all(10.0)),
        Flex(direction: Axis.horizontal,mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Expanded(child: GestureDetector(child:Text('868'+'\n关注', textAlign: TextAlign.center,),onTap: (){ LovePage.goTo(context, 0); },)),
          Expanded(child: GestureDetector(child:Text('123'+'\n粉丝', textAlign: TextAlign.center),onTap: (){ LovePage.goTo(context, 1); },)),
          Expanded(child: GestureDetector(child: Text('325'+'\n浏览', textAlign: TextAlign.center),onTap: (){ myToast('浏览'); },),),
          Expanded(child: GestureDetector(child: Text('5687'+'\n访客', textAlign: TextAlign.center),onTap: (){ myToast('访客'); },)),
        ],),
        Padding(padding: EdgeInsets.all(5.0)),
      ],),
    );
  }

  _centerView() {
    return Container(
      height: 200.0,
      width: double.maxFinite,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      color: Colors.white,
    );
  }

  _bottomView() {
    return Container(
      height: 200.0,
      width: double.maxFinite,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      color: Colors.white,
    );
  }


}