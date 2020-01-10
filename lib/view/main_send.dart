import 'package:flutter/material.dart';
import 'package:flutter_lihui/base/base_state.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/contract/send_contract.dart';
import 'package:flutter_lihui/json_entity_model/common_bool_entity.dart';
import 'package:flutter_lihui/json_entity_model/diary_entity.dart';
import 'package:flutter_lihui/json_entity_model/diary_tag_entity.dart';
import 'package:flutter_lihui/model/InputBean.dart';
import 'package:flutter_lihui/presenter/SendPresenter.dart';
import 'sub/theme_page.dart';

class MainSend extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainSend();
}

class _MainSend extends BaseState<MainSend, SendPresenter> with AutomaticKeepAliveClientMixin implements ISendView{

  TextEditingController _controller1 = new TextEditingController();
  String title = "";
  String content = "";
  String theme = "";
  String tag = "";
  String tagStr = "";
  int themeId = 0;
  int subThemeId = 0;

  @override
  void initStat() {
    mPresenter = SendPresenter();
    _controller1.addListener((){
      title = _controller1.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          Expanded(
            child: SingleChildScrollView(child: Column(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: '标题',
                  hintText: '请输入您要发布的日记标题',
                ),
                controller: _controller1,
              ),
              ListTile(title: Text('内容：$content',maxLines: 1,overflow: TextOverflow.ellipsis,),trailing: Icon(Icons.keyboard_arrow_right,),onTap: (){
                _content();
              },),

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

              ListTile(title: Text('标签：${tagStr.toString()}'),trailing: Icon(Icons.keyboard_arrow_right,),onTap: (){
                _tag();
              },),

            ],),),
          ),

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


  void _content() async {
    dynamic  result = await Navigator.pushNamed(context, '/InputPage', arguments: InputBean(title: '内容', hint: '日记内容',content: '告诉看过心胸宽广u反正会风中劲草喜剧房租回家做饭给现金举行ch6868i关系就像个就高兴发i死舒服发家致富紧张个这句负责中介费徐句喜剧u反正接着发巨款v看v房租几分钟继续看徐fzujxgjxvkv，，ku发试卷租房客虚空嘘嘘负责就像个开心果开心果看v想发租u反正技工学校几个可惜个房租西沟几个选修课v看fzujfxgxjvjvk，if只需姐姐虚空v看吧风俗继续挂机小高考v徐看吧吃if自己洗干净刚下课续卡v想看吧吃发i在看小高考虚空虚空v显卡v想空虚发i这个小家具辛苦V型看徐v显卡复习'));
    print('_content:$result');
    setState(() {
      content = result;
    });
  }

  _tag() async {
    dynamic result = await Navigator.pushNamed(context, '/TagPage');
    List<TagItem> tagList = result;
    tagList.forEach((item){
      tag +=item.tagId + '|';
      tagStr += item.tagStr+'-';
    });
    setState(() {
    });
  }

  void _publish() {
    if(title.isEmpty){
      myToast('标题不能为空');
      return;
    } else if(content.isEmpty) {
      myToast('内容不能为空');
      return;
    }else if(tag.toString().isEmpty){
      myToast('标签不能为空');
      return;
    }
    DiaryItem item = new DiaryItem(content: content,subTheme: subThemeId,theme: themeId,title: title,userId: MyConfig.userId,tagId: tag.toString());
    mPresenter.sendDiary(item);
  }

  @override
  void dispos() {
    // TODO: implement dispos
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void onFail(String e) {
    // TODO: implement onFail
  }

  @override
  void onSend(CommonBoolEntity data, bool isRefresh) {
    myToast('发布成功');
    print('发布成功');
  }
}