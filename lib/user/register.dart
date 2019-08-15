import 'package:flutter/material.dart';


class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register>{
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
                        if((_key.currentState as FormState).validate()){
                          //验证通过提交数据
                          print('注册 name:${name},pwd:${pwd}');
                        }
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
}