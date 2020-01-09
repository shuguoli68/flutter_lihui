import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'sub/theme_page.dart';

class MainSend extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainSend();
}

class _MainSend extends State<MainSend>{

  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  String title = "";
  String content = "";
  String theme = "";
  String tag = "";
  int themeId = 0;
  int subThemeId = 0;

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

          SingleChildScrollView(child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: '标题',
                  hintText: '请输入您要发布的日记标题',
                  prefixIcon: Icon(Icons.lock)
              ),
              controller: _controller1,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '内容',
                hintText: '请输入您要发布的日记内容',
                prefixIcon: Icon(Icons.lock),
              ),
              controller: _controller2,
              minLines: 8,
              maxLines: 50,
            ),
            ListTile(title: Text('分类：$theme'),trailing: Icon(Icons.keyboard_arrow_right,),onTap: (){
              Navigator
                  .of(context).push(MaterialPageRoute(builder: (_)=> ThemePage()))
                  .then((onValue){
                    Map<String, String> key = onValue;
                    if(onValue==null){
                      myToast('未选择分类');
                      return;
                    }

              });
            },),

            ListTile(title: Text('标签：$tag'),trailing: Icon(Icons.keyboard_arrow_right,),onTap: (){

            },),

          ],),),

          Padding(
            padding: const EdgeInsets.only(top: 30.0,left: 5.0,right: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('发布'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: _publish,
                ))
              ],
            ),
          ),

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