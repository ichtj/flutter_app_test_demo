import 'package:flutter/material.dart';

//flutter中文网 1-2章节
//路由跳转并带参数
class RouteSendParamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("new Route"),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () async {
              //路由命名并携带参数
              var result = await Navigator.of(context)
                  .pushNamed("route_callback", arguments: "我是提示xxxx");
              //输出`TipRoute`路由返回结果
              print("路由返回值：$result");
            },
            child: Text("打开路由提示页")),
      ),
    );
  }
}
