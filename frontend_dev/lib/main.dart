import 'package:flutter/material.dart';
import 'package:frontend_dev/drawer_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 全局主题配置
      theme: ThemeData(
        // TODO:Colors 颜色方案
        primaryColor: Colors.black,
        // TODO:Themes 样式方案
      ),
      // 入口界面控件
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _avatar = 'imgs/profile.jpeg'; // 头像
  String _nickname = 'nickname'; // 昵称
  String _email = 'nickname@xxx.xxx'; // 邮箱

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // TODO:合并appBar
      body: new Center(
        child: new Text(
          'Hello there!',
          style: new TextStyle(
            fontSize: 60,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // TODO:合并bottomNavigationBar
      drawer: DrawerPage(
        oriAvatar: _avatar,
        oriNickname: _nickname,
        oriEmail: _email,
      ),
      // TODO:合并floatingActionButton
    );
  }
}
