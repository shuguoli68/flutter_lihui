import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/json_entity_model/login_entity.dart';

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
      body: Container(
        padding:EdgeInsets.all(10.0),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(children: <Widget>[
          _headView(),
          _centerView(),
          _bottomView()
        ],),
      ),
    );
  }

  _headView() {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        ClipOval(
          child: Image.asset('images/img.png',width: 50,height: 50,fit: BoxFit.fitHeight,),
        ),
        Flex(direction: Axis.vertical,children: <Widget>[
          Expanded(flex:1, child: Padding(padding: EdgeInsets.only(left: 5),child: Text(user.name),),),
          Expanded(flex:1, child: Padding(padding: EdgeInsets.only(left: 5),child: Text(user.userId),),),
        ],),
        IconButton(icon: Icon(Icons.settings), onPressed: (){})
      ],),
      Padding(padding: EdgeInsets.all(10.0)),
      Row(children: <Widget>[
        Text('关注'),
        Text('粉丝'),
        Text('浏览'),
        Text('访客'),
      ],),
    ],);
  }

  _centerView() {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
    );
  }

  _bottomView() {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
    );
  }


}