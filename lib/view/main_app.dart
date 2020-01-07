import 'package:flutter/material.dart';
import 'main_navigation.dart';
import 'package:flutter_lihui/common/my_public.dart';

import 'sub/home_drawer.dart';

class MainApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainApp();
}

class _MainApp extends State<MainApp>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          drawer: Drawer(child: HomeDrawer(context).homeDrawer(),),
          appBar: AppBar(
            title: Text('LiHui'),
            leading: null,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {  }),
              IconButton(icon: Icon(Icons.add), onPressed: () {  }),
            ],
          ),
          body: MainNavigation()
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop(){
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('提示'),
          content: Text('确认退出APP吗？'),
          actions: <Widget>[
            FlatButton(onPressed: ()=> Navigator.of(context).pop(false), child: Text('取消')),
            FlatButton(onPressed: ()=> Navigator.of(context).pop(true), child: Text('确认'))
          ],
        )
    );
  }
}