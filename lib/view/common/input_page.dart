import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/model/InputBean.dart';

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputPage();
}

class _InputPage extends State<InputPage> {

  TextEditingController _controller = new TextEditingController();
  InputBean bean = new InputBean(title: '填写',text: '输入',hint: '请输入内容',content: '',min: 1,max: 50);

  initData() {
    InputBean second = ModalRoute.of(context).settings.arguments;
    if (second.title !=null && second.title.isNotEmpty) bean.title = second.title;
    if (second.text !=null && second.text.isNotEmpty) bean.text = second.text;
    if (second.hint !=null && second.hint.isNotEmpty) bean.hint = second.hint;
    if (second.content !=null && second.content.isNotEmpty) {
      bean.content = second.content;
      _controller.text = second.content;
    }
    if (second.min !=null && second.min>0) bean.min = second.min;
    if (second.max !=null && second.max>0) bean.max = second.max;
    if (bean.min > bean.max){
      int mMid = bean.min;
      bean.min = bean.max;
      bean.max = mMid;
    }
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(title: Text(bean.title),),
        body: Container(
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              ConstrainedBox(constraints: BoxConstraints(minHeight: 100.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: bean.text,
                      hintText: bean.hint,
                      border: InputBorder.none
                  ),
                  minLines: 10,
                  maxLines: 100,
                  controller: _controller,
                ),
              ),
              Text('3/100',textAlign: TextAlign.right,),
            ],),
          ),
        ),
      ),
      onWillPop: (){
        Navigator.pop(context,_controller.text);
        return ;
      },
    );
  }

}