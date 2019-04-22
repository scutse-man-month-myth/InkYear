import 'package:flutter/material.dart';
import 'package:frontend_dev/pages/drawer_page.dart';
import 'package:frontend_dev/pages/weather_page.dart';
import 'package:frontend_dev/pages/state_page.dart';
import 'package:frontend_dev/tools/TopReminder.dart'; // TODO:整合进AppBar
import 'package:frontend_dev/tools/Toast.dart';
import 'package:frontend_dev/datas/Location.dart'; // TODO:降低这个类的耦合

void main() => runApp(MyApp());

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _avatar = 'imgs/profile.jpeg'; // 头像
  String _nickname = 'nickname'; // 昵称
  String _email = 'nickname@xxx.xxx'; // 邮箱
  int _tabIndex = 2;
  var _bodys;
  String month = "Jan";
  int day = 1;
  String date = "Jan 1";
  String week = "MONDAY";

  Widget _getBody(int i){
    return new Center(
      child: new Text("body $i"),
    );
  }

  void initDate(){
    _bodys = [
      _getBody(0),
      _getBody(1),
      new DailyRecord(),
    ];
  }

  void openTopReminder(context) {
    // 导航器（`Navigator`）组件，用于管理具有堆栈规则的一组子组件。
    // 许多应用程序在其窗口组件层次结构的顶部附近有一个导航器，以便使用叠加显示其逻辑历史记录，
    // 最近访问过的页面可视化地显示在旧页面之上。使用此模式，
    // 导航器可以通过在叠加层中移动组件来直观地从一个页面转换到另一个页面。
    // 类似地，导航器可用于通过将对话框窗口组件放置在当前页面上方来显示对话框。
    // 导航器（`Navigator`）组件的关于（`of`）方法，来自此类的最近实例的状态，它包含给定的上下文。
    // 导航器（`Navigator`）组件的推（`push`）方法，将给定路径推送到最紧密包围给定上下文的导航器。
    Navigator.of(context).push(
      // 页面路由生成器（`PageRouteBuilder`）组件，用于根据回调定义一次性页面路由的实用程序类。
      PageRouteBuilder(
        // 转换完成后路由是否会遮盖以前的路由。
        opaque: false,
        // 页面构建器（`pageBuilder`）属性，用于构建路径的主要内容。
        pageBuilder: (BuildContext context, _, __) {
          return TopReminder(widgetChild:new WeatherPage());
        },
        // TODO: 第5步：实现“过渡动画”。
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    initDate();
    return Container(
      decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("imgs/background2.jpg"),
        fit: BoxFit.fitWidth,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder(builder: (BuildContext context){
            return new Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new AssetImage("imgs/timg.jpg"),
                ),
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          }),
          title: new Text(_nickname, style: new TextStyle(fontSize: 25),),
          actions: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: new Row(
                children: <Widget>[
                  new Text(date, style: new TextStyle(fontSize: 16),),
                  new Padding(padding: EdgeInsets.fromLTRB(7, 0, 0, 0)),
                  new Text(week, style: new TextStyle(fontSize: 16),),
                ],
              ),
            ),
            new IconButton(
                icon: new Icon(Icons.cloud),
                onPressed: () {
                  if(county == ""){
                    Toast.toast(context, "请先选择地址");
                  }else{
                    openTopReminder(context);
                  }
                }
            ),
            new IconButton(icon: new Icon(Icons.format_list_bulleted, color: Colors.white,), onPressed: null)
          ],
        ),
        body: _bodys[_tabIndex],
        bottomNavigationBar: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.assignment,
                size: 35,
                color: _tabIndex == 0 ? Colors.blueAccent : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _tabIndex = 0;
                });
              },
            ),
            new IconButton(
              icon: new Icon(
                Icons.border_color,
                size: 35,
                color: _tabIndex == 1 ? Colors.blueAccent : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _tabIndex = 1;
                });
              },
            ),
            new IconButton(
              icon: new Icon(
                Icons.accessibility,
                size: 35,
                color: _tabIndex == 2 ? Colors.blueAccent : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _tabIndex = 2;
                });
              },
            ),
          ],
        ),
        drawer: DrawerPage(
          oriAvatar: _avatar,
          oriNickname: _nickname,
          oriEmail: _email,
        ),
        floatingActionButton: IconButton(
            icon: new Icon(
              Icons.add_circle,
              size: 40,
            ),
            onPressed: null
        ),
      )
    );
  }
}
