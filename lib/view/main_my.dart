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
      color: Colors.white,
      child: Column(children: <Widget>[
        Flex(direction: Axis.horizontal,children: <Widget>[
          ClipOval(
            child: Image.asset('images/img.png',width: 50,height: 50,fit: BoxFit.fitHeight,),
          ),
          Column(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 5),child: Text(user.name),),
            Padding(padding: EdgeInsets.only(left: 5),child: Text(user.userId),),
          ],),
          Expanded(flex:1, child: Container()),
          IconButton(icon: Icon(Icons.settings), onPressed: (){})
        ],),
        Padding(padding: EdgeInsets.all(5.0)),
        Flex(direction: Axis.horizontal, children: <Widget>[
          Expanded(child: Text('关注'),),
          Expanded(child: Text('粉丝'),),
          Expanded(child: Text('浏览'),),
          Expanded(child: Text('访客'),),
        ],),
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