import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/model/InputBean.dart';
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
  String tag = "0";
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
              ),
              controller: _controller1,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '内容',
                hintText: '请输入您要发布的日记内容',
              ),
              controller: _controller2,
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
                    themeId = int.parse(key['themeId']);
                    subThemeId = int.parse(key['subThemeId']);
                    setState(() {
                      theme = key['themeName'] + '-' + key['subThemeName'];
                    });
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
    dynamic  result = await Navigator.pushNamed(context, '/InputPage', arguments: InputBean(title: '内容', hint: '日记内容',content: '告诉看过心胸宽广u反正会风中劲草喜剧房租回家做饭给现金举行ch6868i关系就像个就高兴发i死舒服发家致富紧张个这句负责中介费徐句喜剧u反正接着发巨款v看v房租几分钟继续看徐fzujxgjxvkv，，ku发试卷租房客虚空嘘嘘负责就像个开心果开心果看v想发租u反正技工学校几个可惜个房租西沟几个选修课v看fzujfxgxjvjvk，if只需姐姐虚空v看吧风俗继续挂机小高考v徐看吧吃if自己洗干净刚下课续卡v想看吧吃发i在看小高考虚空虚空v显卡v想空虚发i这个小家具辛苦V型看徐v显卡复习'));
    print('result:$result');
  }
}