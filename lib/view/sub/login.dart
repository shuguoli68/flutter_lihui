import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lihui/entity_factory.dart';
import 'package:flutter_lihui/http/api.dart';
import 'package:flutter_lihui/http/api_service.dart';
import 'package:flutter_lihui/http/http_util.dart';
import 'package:flutter_lihui/json_entity_model/login_entity.dart';
import 'package:flutter_lihui/view/main_app.dart';
import 'package:flutter_lihui/common/my_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_lihui/common/my_public.dart';

import 'package:flutter_lihui/view/sub/register.dart';
import 'package:permission/permission.dart';

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
    SPKey.spGetStr(SPKey.USER_NAME).then((value){
      _controller1.text = value;
    });
    SPKey.spGetStr(SPKey.PASS_WORD).then((value){
      _controller2.text = value;
    });

    requestPermiss();
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
//                validator: (v){
//                  return v.trim().length>0 ? null : '用户名不能为空';
//                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入六位密码',
                    prefixIcon: Icon(Icons.lock)
                ),
                controller: _controller2,
                obscureText: true,
//                validator: (v){
//                  return v.trim().length <= 6 ? null : '密码为六位';
//                },
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

              Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 5.0,right: 5.0),
                child: ListTile(title: Text('还没账号？去注册',style: TextStyle(color: Theme.of(context).primaryColor),),onTap: (){
                  Navigator
                      .of(context).push(MaterialPageRoute(builder: (_)=> Register()))
                      .then((onValue){
                    if(onValue == null) return;
                    Map<String,String> map = onValue;
                    String txt1 = map['userId'];
                    String txt2 = map['passWord'];
                    if(txt1.isNotEmpty) {
                      _controller1.text = txt1;
                      if (txt2.isNotEmpty) {
                        _controller2.text = txt2;
                        name = txt1;
                        pwd =  txt2;
                        _login();
                        myToast( '正在登录...');
                      }
                    }
                  });
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    if((_key.currentState as FormState).validate()){
    ApiService.login(name, pwd).then((response){
      LoginEntity bean = EntityFactory.generateOBJ<LoginEntity>(response.data);
      if(bean.code == 200) {
        SPKey.spSetBool(SPKey.IS_LOGIN, true);
        SPKey.spSetStr(SPKey.USER_NAME, bean.data.userId);
        SPKey.spSetStr(SPKey.PASS_WORD, bean.data.passWord);
        MyConfig.userId = bean.data.userId;
        print('登录 name:${name},pwd:$pwd,bean:${bean.toJson()}');
        goToRm(context, MainApp());
      }else{
        print(bean.msg);
        Fluttertoast.showToast(msg: bean.msg);
      }
    });

    }
  }

  _test() async {
    var result = await HttpUtils.request(
        Api.test,
        method: HttpUtils.GET
    );
    print('测试：$result');
  }

  requestPermiss() async {
    //请求权限
//    var permissions = await Permission.getPermissionsStatus([PermissionName.Calendar, PermissionName.Camera]);
//    permissions.forEach((f){
//    });
    var permissionNames = await Permission.requestPermissions([PermissionName.Storage, PermissionName.Camera]);

//    Permission.openSettings;
  }
}