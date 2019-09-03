import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/basic_widgets/index.dart';
import 'package:flutter_app_test_demo/custom_icon/index.dart';
import 'package:flutter_app_test_demo/grid_view/index.dart';
import 'package:flutter_app_test_demo/grid_view/gridviewpage.dart';
import 'package:flutter_app_test_demo/list_view/index.dart';
import 'package:flutter_app_test_demo/sliver_widgets/index.dart';
import 'package:flutter_app_test_demo/studys/day1/route_callback_param.dart';
import 'package:flutter_app_test_demo/studys/day1/route_send_param.dart';

// 我是入口，类似于java中的 static main()
void main() => runApp(MyApp());
// 我是最外层的容器，我不关心里面内容的变化，所以是无状态的。

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //返回给你一个MaterialApp，至于内部还有啥，看参数
    return MaterialApp(
      //应用名称
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, //title的背景颜色
      ),
      routes: {
        //这里是注册路由表
        "route_send":(context)=>RouteSendParamPage(),//路由跳转并带参数
        "route_callback":(context)=>RouteCallBackParmPage(),//路由跳转并带返回值
      },
      // 这个Widget是我们自定义的
      home: HomePage(title: 'Flutter Demos'), //设置Title
    );
  }
}

//listView使用 及点击效果
//StatefulWidget类本身是不变的
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

//State类中持有的状态在widget生命周期中可能改变
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData(
          context, titleItems[i], iconItems[i], subTitleItems[i]));
    }
    // 分割线
    var divideTiles =
        ListTile.divideTiles(context: context, tiles: _list).toList();

    return new Scaffold(
      //导航栏
      appBar: new AppBar(
        title: new Text('Flutter ListView'),
      ),
      //body:new Center将其子组件树对齐到屏幕中心
      body: new Scrollbar(
        // 默认写法
//         child: new ListView(
//           children: _list,
//         ),

        // ListView.builder写法
//        child: new ListView.builder(
//            // 无分割线
////            itemBuilder: (context, item) {
////              return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]);
////            },
//            // 有分割线
//            itemBuilder: (context, item) {
//              return new Container(
//                child: new Column(
//                  children: <Widget>[
//                    buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]),
//                    new Divider()
//                  ],
//                ),
//              );
//            },
//            itemCount: iconItems.length,
//        ),

        // ListView.separated写法
        child: new ListView.separated(
            itemBuilder: (context, item) {
              return buildListData(context, titleItems[item], iconItems[item],
                  subTitleItems[item]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                new Divider(),
            itemCount: iconItems.length),
      ),
    );
  }

  Widget buildListData(BuildContext context, String titleItem, Icon iconItem,
      String subTitleItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        subTitleItem,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        switch (titleItem) {
          case "TAB+GridView":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return GridViewDemo();
            }));
            break;
          case "TAB+ListView":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ListViewDemo();
            }));
            break;
          case "GridView":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return GridViewPage();
            }));
            break;
          case "BasicWidgetsDemo":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BasicWidgetsDemo();
            }));
            break;
          case "CustomIconsDemo":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CustomIconsDemo();
            }));
            break;
          case "SliverWidgetsDemo":
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SliverWidgetsDemo();
            }));
            break;
          case "NewRouteDay1"://路由跳转
          Navigator.pushNamed(context, "route_send");
            break;
        }
      },
    );
  }

  void toNextIntent(Widget widget){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  // 数据源
  List<String> titleItems = <String>[
    'TAB+GridView',
    'GridView',
    'ListViewUse',
    'BasicWidgetsDemo',
    'CustomIconsDemo',
    'SliverWidgetsDemo',
    'NewRouteDay1',
    'wifi_tethering',
    'wifi_lock',
    'widgets',
    'weekend',
    'web',
    '图accessible',
    'ac_unit',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard),
    new Icon(Icons.print),
    new Icon(Icons.router),
    new Icon(Icons.pages),
    new Icon(Icons.zoom_out_map),
    new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for),
    new Icon(Icons.wifi_tethering),
    new Icon(Icons.wifi_lock),
    new Icon(Icons.widgets),
    new Icon(Icons.weekend),
    new Icon(Icons.web),
    new Icon(Icons.accessible),
    new Icon(Icons.ac_unit),
  ];

  List<String> subTitleItems = <String>[
    'subTitle: keyboard',
    'subTitle: print',
    'subTitle: router',
    'subTitle: pages',
    'subTitle: zoom_out_map',
    'subTitle: zoom_out',
    'subTitle: youtube_searched_for',
    'subTitle: wifi_tethering',
    'subTitle: wifi_lock',
    'subTitle: widgets',
    'subTitle: weekend',
    'subTitle: web',
    'subTitle: accessible',
    'subTitle: ac_unit',
  ];
}
