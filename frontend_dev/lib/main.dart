import 'package:flutter/material.dart';
import 'package:frontend_dev/pages/drawer_page.dart';
import 'package:frontend_dev/pages/weather_page.dart';
import 'package:frontend_dev/pages/state_page.dart';
import 'package:frontend_dev/tools/TopReminder.dart'; // TODO:整合进AppBar
import 'package:frontend_dev/tools/Toast.dart';
import 'package:frontend_dev/constants/ThemeColors.dart';
import 'package:frontend_dev/constants/IconStyle.dart';
import 'package:frontend_dev/datas/Location.dart'; // TODO:降低这个类的耦合

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 全局主题配置
      theme: ThemeData(
        primaryColor: ThemeColors.primaryColor,
        primaryIconTheme: IconStyle.primaryIconStyle,
        // primaryTextTheme: ,
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
  // 用户参数
  // TODO:封装成User类
  String _avatar = 'imgs/profile.jpeg'; // 头像
  String _nickname = 'nickname'; // 昵称
  String _email = 'nickname@xxx.xxx'; // 邮箱

  // 日期参数
  // TODO:封装成Date类或直接使用内置Date类
  String month = "Jan";
  int day = 1;
  String date = "Jan 1";
  String week = "MONDAY";

  // 页面参数
  // TODO:在initState里初始化
  List<Widget> _bodys;
  int _tabIndex = 2;

  // TODO:临时填充将被替换
  Widget _getBody(int index) {
    return Center(
      child: Text("body $index"),
    );
  }

  void _openTopReminder(context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        // 当前的路由不会遮盖之前的路由
        opaque: false,
        // 构建路由的主要内容
        pageBuilder: (BuildContext context, _, __) => TopReminder(child:WeatherPage()),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // TODO:写成生成器模式
    _bodys = [
      _getBody(0),
      _getBody(1),
      DailyRecord(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("imgs/background2.jpg"),
          fit: BoxFit.fitWidth,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder( // 需要上下文辅助打开侧边栏
            builder: (BuildContext context) =>
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: GestureDetector(
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage("imgs/timg.jpg"),
                  ),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
          ),
          title: Text(
            _nickname,
            style: TextStyle(fontSize: 25),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    date,
                    style: TextStyle(fontSize: 16),),
                  Padding(padding: EdgeInsets.fromLTRB(7, 0, 0, 0)),
                  Text(
                    week,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
                // TODO:动态变化天气图标
                icon: Icon(Icons.cloud),
                onPressed: () {
                  if(county == ""){ // 未选择地址
                    Toast.toast(context, "请先选择地址");
                  }
                  else{ // 已选择地址
                    _openTopReminder(context);
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
