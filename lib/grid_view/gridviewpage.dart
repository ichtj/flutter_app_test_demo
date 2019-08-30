import 'package:flutter/material.dart';

//gridView使用 及点击效果
class GridViewPage extends StatefulWidget {
  GridViewPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  //图片
  String imgsrc = 'http://5b0988e595225.cdn.sohucs.com/images' +
      '/20171218/342e43903694448b91698b5ce7623314.jpeg';

  //数据加载
  List<Widget> buildGridTileList(int number) {
    List<Widget> widgetList = new List();

    for (int i = 0; i < number; i++) {
      widgetList.add(new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          image: new DecorationImage(
            image: new NetworkImage(this.imgsrc),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            new BoxShadow(
              offset: new Offset(0.0, 1.0),
              blurRadius: 2.0,
              color: const Color(0xffaaaaaa),
            ),
          ],
        ),
      ));
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter GridView'),
      ),
      body: new Scrollbar(
        child: GridView.count(
          //水平子Widget之间间距
          crossAxisSpacing: 10.0,//次轴方向上的空隙间距；
          //垂直子Widget之间间距
          mainAxisSpacing: 30.0,//主轴方向上的空隙间距；
          //GridView内边距
          padding: EdgeInsets.all(10.0),
          //一行的Widget数量
          crossAxisCount: 2,//列数，即一行有几个子元素；
          //子Widget宽高比例
          childAspectRatio: 2.0,//子元素的宽高比例。
          //子Widget列表
          children: buildGridTileList(15),
        ),
      ),
    );
  }
}
