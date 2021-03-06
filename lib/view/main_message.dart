import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MainMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainMessage();
}

class _MainMessage extends State<MainMessage> with AutomaticKeepAliveClientMixin{
  static const listMax = 100;//列表最多加载条数
  static const loadingTag = "##loading##";//正在加载
  var _list =<String>[loadingTag];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: _sliverBuilder,
            body: ListView.separated(
                itemBuilder: _itemBuilder,
                separatorBuilder: (context,index){
                  return Divider(color: Colors.blue,);
                },
                itemCount: _list.length
            )
        )
    );
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled){
    return <Widget>[
      SliverAppBar(
        centerTitle: false,//标题是否居中
        expandedHeight: 200.0,//展开的高度
        floating: false,//是否随着滑动隐藏标题
        pinned: true,//是否固定在顶部
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: Text('热搜'),
          background: Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
            fit: BoxFit.cover,
          ),
        ),
      )
    ];
  }

  Widget _itemBuilder(BuildContext context, int index){
    if(_list[index] == loadingTag){//加载中...
      if(_list.length < listMax){
        _loadData(false);
        return Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Text('正在加载...',style: TextStyle(color: Colors.green),),
        );
      }else{
        return Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Text('没有更多数据了',style: TextStyle(color: Colors.red),),
        );
      }
    }
    return ListTile(
      title: Text(_list[index],style: TextStyle(color: Colors.black87),),
    );
  }

  void _loadData(bool isRefresh) {
    Future.delayed(Duration(seconds: 2))
        .then((e) { //每次生成20个单词
      _list.insertAll(
          _list.length-1,
          generateWordPairs()
              .take(20)
              .map((t)=>t.asPascalCase)
              .toList()
      );
      setState(() {

      });
    });
  }
}