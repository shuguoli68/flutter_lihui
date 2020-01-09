import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter_lihui/http/api_service.dart';
import 'package:flutter_lihui/json_entity_model/diary_theme_entity.dart';

import '../../entity_factory.dart';

class ThemePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ThemePage();
}

class _ThemePage extends State<ThemePage>{

  DiaryThemeEntity _entity = null;

  int selectPos = 0;

  @override
  void initState() {
    super.initState();
    _getThemeEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(baseBg),
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: new ListView.builder(
                    itemCount: _entity.data.length,
                    itemBuilder: (BuildContext context, int position) {
                      ThemeItem item = _entity.data[position];
                      print('点击：${item.themeName}');
                      return  ListTile(title: Text(item.themeName),onTap: (){
                        setState(() {
                          selectPos = position;
                        });
                      },);
                    }),
              )),
          new Expanded(
              flex: 5,
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: childChilden(selectPos),
              ),
          ),
        ],
      ),
    );
  }

  List<Widget> childChilden(int index) => List.generate(_entity.data[index].subThemes.length, (subIndex) {
    SubTheme item = _entity.data[index].subThemes[subIndex];
    return GestureDetector(
      onTap: (){
        print('选择：${item.toString()}');
        var key = Map<String, String>();
        key["themeId"] = _entity.data[index].themeId.toString();
        key["themeName"] = _entity.data[index].themeName;
        key["subThemeId"] = item.subThemeId.toString();
        key["subThemeName"] = item.subThemeName;
        goPop(context, key);
      },
      child: Chip(
        label: Text(item.subThemeName),
        avatar: CircleAvatar(
          backgroundColor: Color(0xfff1f1f1),
          child: Text(item.subThemeName.substring(0,1).isEmpty?"C":item.subThemeName.substring(0,1),style: TextStyle(fontSize: 12.0),),
        ),
      ),
    );
  });

  _getThemeEntity(){
    ApiService.allTheme().then((response){
      setState(() {
        _entity = EntityFactory.generateOBJ<DiaryThemeEntity>(response.data);
      });
    });
  }
}