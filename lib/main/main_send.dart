import 'package:flutter/material.dart';
import 'package:flutter_lihui/entity_factory.dart';
import 'package:flutter_lihui/http/api.dart';
import 'package:flutter_lihui/json_entity_model/publish_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainSend extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainSend();
}

class _MainSend extends State<MainSend>{

  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  String title = "";
  String content = "";

  @override
  void initState() {
    super.initState();
    _controller1.addListener((){
      title = _controller1.text;
    });
    _controller2.addListener((){
      content = _controller2.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                labelText: '主题',
                hintText: '请输入您要发布的主题',
                prefixIcon: Icon(Icons.lock)
            ),
            controller: _controller1,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: '内容',
                hintText: '请输入您要发布的内容',
                prefixIcon: Icon(Icons.lock),
            ),
            controller: _controller2,
            minLines: 5,
            maxLines: 15,
          ),
          RaisedButton(
            padding: EdgeInsets.all(15.0),
            child: Text('发布', style: TextStyle(color: Colors.green),),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: _publish,
          )
        ],
      )
    );
  }


  void _publish() async {
//    ResultData data = await Api.publish(title, content);
//    if(data.isSuccess) {
//      PublishEntity bean = EntityFactory.generateOBJ<PublishEntity>(data.data);
//      if (bean.code == 200) {
//        print('发布成功:'+bean.data.toString());
//        Fluttertoast.showToast(msg: '发布成功');
//      }
//    }else{
//      print('服务器错误:'+data.code.toString());
//      Fluttertoast.showToast(msg: '服务器错误:'+data.code.toString());
//    }
  }
}