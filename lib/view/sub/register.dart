import 'package:flutter/material.dart';
import 'package:flutter_lihui/base/base_state.dart';
import 'package:flutter_lihui/contract/register_contract.dart';
import 'package:flutter_lihui/presenter/RegisterPresenter.dart';
import 'package:flutter_lihui/common/my_public.dart';


class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends BaseState<Register, RegisterPresenter> implements IRegisterView{
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  GlobalKey _key = new GlobalKey<FormState>();
  String name = "";
  String pwd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册',style: TextStyle(color: Colors.white),),
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
                  return v.trim().length == 6 ? null : '密码为六位';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 5.0,right: 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text('注册'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: (){
//                        if((_key.currentState as FormState).validate()){
                          //验证通过提交数据
                          print('注册 name:${name},pwd:${pwd},mPresenter:$mPresenter');
                          mPresenter.register(name, pwd);
//                        }
                      },))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispos() {
    // TODO: implement dispos
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  void initStat() {
    mPresenter = new RegisterPresenter();
    _controller1.addListener((){
      name = _controller1.text;
    });
    _controller2.addListener((){
      pwd = _controller2.text;
    });
  }

  @override
  void onSuccess() {
    print("注册成功");
    var key = Map<String, String>();
    key["userId"] = name;
    key["passWord"] = pwd;
    goPop(context, key);
  }

  @override
  void onFail(String bean) {
    print("注册失败："+bean);
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }
}