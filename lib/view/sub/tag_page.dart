import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/http/api_service.dart';
import 'package:flutter_lihui/json_entity_model/diary_tag_entity.dart';

import '../../entity_factory.dart';

class TagPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TagPage();
}

class _TagPage extends State<TagPage> {

  List<TagItem> data = new List();
  List<TagItem> select = new List();

  @override
  void initState() {
    super.initState();
    _getTagEntity();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: Text('标签'),),
          body: Scaffold(
            body: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: childChilden(),
            ),
          ),
        ),
        onWillPop: (){
          Navigator.pop(context,select);
          return;
        }
    );
  }

  List<Widget> childChilden() => List.generate(data.length, (subIndex) {
    TagItem item = data[subIndex];
    return GestureDetector(
      onTap: (){
        print('选择：${item.toString()}');
        select.add(item);
//        var key = Map<String, String>();
//        key["themeId"] = _entity.data[index].themeId.toString();
//        key["themeName"] = _entity.data[index].themeName;
//        key["subThemeId"] = item.subThemeId.toString();
//        key["subThemeName"] = item.subThemeName;
//        goPop(context, key);
      },
      child: Chip(
        label: Text(item.tagStr),
        avatar: CircleAvatar(
          backgroundColor: Color(0xfff1f1f1),
          child: Text(item.tagStr.substring(0,1).isEmpty?"C":item.tagStr.substring(0,1),style: TextStyle(fontSize: 12.0),),
        ),
      ),
    );
  });

  _getTagEntity(){
    ApiService.allTag().then((response){
      DiaryTagEntity _entity = EntityFactory.generateOBJ<DiaryTagEntity>(response.data);
      setState(() {
        data = _entity.data;
      });
    });
  }
}