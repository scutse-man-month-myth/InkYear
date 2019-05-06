import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Demo'),
      ),
      body: new Center(
        child: new Stack( //第一个子控件最下面
          alignment: new Alignment(0.6, 0.6),
          //statck
          children: <Widget>[
            new Align(
              alignment: FractionalOffset.center,
//          heightFactor: 40.0,
//          widthFactor: 40.0,
              child: new Image.network( //加载网络图片
                'http://h.hiphotos.baidu.com/image/pic/item/21a4462309f790525fe7185100f3d7ca7acbd5e1.jpg',
                height: 300.0,
                width: 300.0,
                repeat: ImageRepeat.repeat, //图片重复方式
              ),
            ),
            new Opacity(
              opacity: 0.5, //不透明度
              child: new Container(
                width: 300.0,
                height: 400.0,
                color: Colors.blue,
              ),
            ),
            new Opacity(
              opacity: 0.3,
              child: new Container(
                width: 200.0,
                height: 200.0,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
