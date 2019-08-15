import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/sharepre_name.dart';
import 'package:flutter_lihui/main/main_app.dart';
import 'package:flutter_lihui/main/main_navigation.dart';
import 'package:flutter_lihui/user/login.dart';
import 'package:flutter_lihui/common/navigator_push.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiHui',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var timer;

  Widget goTo() {
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    var isLogin = prefs.getBool(SharePreName().IS_LOGIN) ?? false;
    if(isLogin){
      return MainApp();
    }else{
      return Login();
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(milliseconds: 1500),(){
      PushHelper().goAndFinish(context, goTo());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('LiHui'),
//      ),
      body:Center(
        child: Text('闪屏'),
      )
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
