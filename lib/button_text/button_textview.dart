import 'package:flutter/material.dart';
//首页
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //跳转到下一个界面
  void _test() {

  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              textTheme: ButtonTextTheme.accent,
              color: Colors.teal,
              highlightColor: Colors.deepPurpleAccent,
              splashColor: Colors.deepOrangeAccent,
              colorBrightness: Brightness.dark,
              elevation: 50.0,
              highlightElevation: 100.0,
              disabledElevation: 20.0,
              onPressed: _test,
              child: Text(
                'Button 1',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),  RaisedButton(
              textTheme: ButtonTextTheme.accent,
              color: Colors.teal,
              highlightColor: Colors.deepPurpleAccent,
              splashColor: Colors.deepOrangeAccent,
              colorBrightness: Brightness.dark,
              elevation: 50.0,
              highlightElevation: 100.0,
              disabledElevation: 20.0,
              onPressed: _test,
              child: Text(
                'Button 2',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ), RaisedButton(
              textTheme: ButtonTextTheme.accent,
              color: Colors.teal,
              highlightColor: Colors.deepPurpleAccent,
              splashColor: Colors.deepOrangeAccent,
              colorBrightness: Brightness.dark,
              elevation: 50.0,
              highlightElevation: 100.0,
              disabledElevation: 20.0,
              onPressed: _test,
              child: Text(
                'Button 3',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Text(
              'TextView 1',
            ),
            Text(
              'TextView 2',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
