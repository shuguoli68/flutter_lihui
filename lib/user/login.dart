import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/sharepre_name.dart';
import 'package:flutter_lihui/entity_factory.dart';
import 'package:flutter_lihui/http/api.dart';
import 'package:flutter_lihui/http/result_data.dart';
import 'package:flutter_lihui/json_entity_model/test_entity.dart';
import 'package:flutter_lihui/main/main_app.dart';
import 'package:flutter_lihui/common/navigator_push.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login>{
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  GlobalKey _key = new GlobalKey<FormState>();
  String name = "";
  String pwd = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1.addListener((){
      name = _controller1.text;
    });
    _controller2.addListener((){
      pwd = _controller2.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Form(
          key: _key,
          autovalidate: true,
          child:Column(
            children: <Widget>[
              TextFormField(
                decoration:InputDecoration(
                    labelText: '用户名',
                    hintText: '请输入用户名',
                    prefixIcon: Icon(Icons.person)
                ),
                controller: _controller1,
                validator: (v){
                  return v.trim().length>0 ? null : '用户名不能为空';
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入六位密码',
                    prefixIcon: Icon(Icons.lock)
                ),
                controller: _controller2,
                obscureText: true,
                validator: (v){
                  return v.trim().length <= 6 ? null : '密码为六位';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 5.0,right: 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text('登录'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: _login,
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void test() async {
    ResultData data = await Api.test();
    if(data.isSuccess){
      TestEntity bean = EntityFactory.generateOBJ<TestEntity>(data.data);
      print('解析成功：name='+bean.toString());
    }
  }
  void loadUsers() async {
    ResultData data = await Api.loadUsers();
    if(data.isSuccess){
//      TestEntity bean = EntityFactory.generateOBJ<TestEntity>(data.data);
      print('解析成功：'+data.data.toString());
    }
  }

  void userList(int pageIndex) async {
    ResultData data = await Api.userList(pageIndex);
    if(data.isSuccess){
//      TestEntity bean = EntityFactory.generateOBJ<TestEntity>(data.data);
      print('解析成功：'+data.data.toString());
    }
  }

  _login() async {
    if((_key.currentState as FormState).validate()){
      userList(name.length);
      //验证通过提交数据
      print('登录 name:${name},pwd:${pwd}');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(SharePreName().IS_LOGIN, true);
      PushHelper().goAndFinish(context, MainApp());
    }
  }
}