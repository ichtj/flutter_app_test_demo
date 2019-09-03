import 'package:flutter/material.dart';

//接收路由参数并返回参数
class RouteCallBackParmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var text=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),//显示参数
              RaisedButton(//点击button之后返回值
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
