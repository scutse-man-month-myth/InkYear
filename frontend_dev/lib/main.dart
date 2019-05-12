import 'package:flutter/material.dart';

import 'package:frontend_dev/pages/state_page.dart';
import 'package:frontend_dev/pages/drawer_page.dart';
import 'package:frontend_dev/pages/weather_page.dart';
import 'package:frontend_dev/widgets/TopReminder.dart';
import 'package:frontend_dev/widgets/Toast.dart';
import 'package:frontend_dev/constants/ThemeColors.dart';
import 'package:frontend_dev/constants/IconStyle.dart';
import 'package:frontend_dev/constants/StringStyle.dart';
import 'package:frontend_dev/constants/SourceImages.dart';
import 'package:frontend_dev/constants/StateMap.dart';
import 'package:frontend_dev/constants/AntDesignIcons.dart';
import 'package:frontend_dev/datas/Location.dart'; // TODO:降低类的耦合
import 'package:frontend_dev/pages/card_page.dart';
import 'package:frontend_dev/pages/card_packet_page.dart';
import 'package:frontend_dev/pages/calendar_page.dart';
import 'package:frontend_dev/pages/enter_page.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:frontend_dev/database/table_state.dart';
import 'package:frontend_dev/database/table_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 全局主题配置
      theme: ThemeData(
        /*primaryColor: ThemeColors.primaryColor,
        backgroundColor: ThemeColors.backgroundColor,
        accentColor: ThemeColors.accentColor,
        primaryIconTheme: IconStyle.primaryIconStyle,
        primaryTextTheme: StringStyle.primaryTextStyle,*/
      ),
      // 入口界面控件
      // title: '墨年InkYear',
      home: EnterPage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  int currentState = 100; // 状态当前值
  int currentMental = 100; // 佛系当前值
  int currentPhysical = 100; // 养生当前值
  int currentSkill = 100; // 技能当前值
  int currentSense = 100; // 素养当前值
  int currentOthers = 100; // 其它当前值
  String stateImg = SourceImages.soso; // 小人图像
  // TODO:数据库重写
  IconData stateIcon = AntDesignIcons.smile; // 小人心情
  List<Widget> chips = [
    Chip(
      label: Text("Daily"),
      avatar: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.alarm_on, color: Colors.black),
      ),
    ),
    Chip(
      label: Text("All >>"),
      avatar: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.dashboard, color: Colors.black),
      ),
    ),
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 用户参数
  // TODO: 数据库重写
  String _avatar = SourceImages.avatar; // 头像
  String _nickname = 'Man-Month'; // 昵称
  String _email = 'manmonth@gmail.com'; // 邮箱
  String _password = 'password'; // 密码
  TextStyle _nicknameTextStyle = TextStyle(fontSize: 25);

  // 日期参数
  final List<String> _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July' 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final List<String> _weeks = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'STA', 'SUN'];
  TextStyle _dateTextStyle = TextStyle(fontSize: 16, fontStyle: FontStyle.normal);
  TextStyle _weekTextStyle = TextStyle(fontSize: 16, fontStyle: FontStyle.italic);

  // 页面参数
  List<Widget> _bodys;
  int _tabIndex = 1;
  bool _isEdit = true;

  // 日历信息
  // List<int> tags = [stateTags.skill.index, stateTags.mental.index];
  // List<String> titles = ['Hello InkYear', 'McDonald'];
  List<int> tags = [];
  List<String> titles = [];

  @override
  void initState() {
    super.initState();
    _bodys = [
      // TODO: 联动传参
      CalenderPage(tags: tags, titles: titles),
      CardPage(),
      DailyRecord(
        currentState: widget.currentState,
        currentMental: widget.currentMental,
        currentPhysical: widget.currentPhysical,
        currentSkill: widget.currentSkill,
        currentSense: widget.currentSense,
        currentOthers: widget.currentOthers,
        image: widget.stateImg,
        mood: widget.stateIcon,
      )
    ];
  }

  void _buildDailyRecord(int totalState) async {
    widget.currentState = await queryTotalState();
    widget.currentMental = await querySingleState(States.mental.index); // 佛系当前值
    widget.currentPhysical = await querySingleState(States.physical.index); // 养生当前值
    widget.currentSkill = await querySingleState(States.skill.index); // 技能当前值
    widget.currentSense = await querySingleState(States.sense.index); // 素养当前值
    widget.currentOthers = await querySingleState(States.others.index);
    if(totalState > 1500)
      widget.stateImg = SourceImages.good;
    else if(totalState < 1000)
      widget.stateImg = SourceImages.bad;
    else
      widget.stateImg = SourceImages.soso;
  }

  void _buildCalender() {

  }

  String _getMonth() => _months[DateTime.now().month-1];
  String _getDay() => '${DateTime.now().day}';
  String _getDate() => _getMonth() + ' ' + _getDay();
  String _getWeek() => _weeks[DateTime.now().weekday-1];

  void _openTopReminderCallback(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        // 当前的路由不会遮盖之前的路由
        opaque: false,
        // 构建路由的主要内容
        pageBuilder: (BuildContext context, _, __) => TopReminder(child:WeatherPage(), reminderText: 'WeatherPage',),
      ),
    );
  }

  void _openCardPacketCallback() {
    Navigator.push<String>(
      context,
      new MaterialPageRoute(builder: (context) => new CardPacketPage()),
    ).then((String result){
      Toast.toast(context, result);
    });
  }

  Widget _buildBottomNavigatorButtons() {
    return FancyBottomNavigation(
      tabs: [
        TabData(iconData: Icons.calendar_today, title: "Calender"),
        TabData(iconData: Icons.edit, title: "Card"),
        TabData(iconData: Icons.accessibility, title: "State"),
      ],
      onTabChangedListener: (position) async {
        // 强制刷新状态页面
        int totalState = await queryTotalState();
        await _buildDailyRecord(totalState);
        _bodys[2] = DailyRecord(
          currentState: widget.currentState,
          currentMental: widget.currentMental,
          currentPhysical: widget.currentPhysical,
          currentSkill: widget.currentSkill,
          currentSense: widget.currentSense,
          currentOthers: widget.currentOthers,
          image: widget.stateImg,
          mood: widget.stateIcon,
          deltaState: totalState - 1250,
        );
        // TODO: 强制刷新日历页面
        setState(() {
          _tabIndex = position;
          if(_tabIndex == 1) _isEdit = true;
          else _isEdit = false;
        });
      },
      barBackgroundColor: Colors.white,
      textColor: Colors.black54,
      circleColor: Colors.blue[300],
      initialSelection: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // 背景图片
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(SourceImages.background),
          fit: BoxFit.fitWidth,
        )
      ),
      // 整体布局
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (BuildContext context) =>
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Theme.of(context).backgroundColor,
                      backgroundImage: AssetImage(SourceImages.avatar),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    }
                  ),
                ]
              ),
          ),
          title: Text(
            _nickname,
            style: _nicknameTextStyle,
          ),
          actions: <Widget>[
            // 显示日期
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    _getDate(),
                    style: _dateTextStyle,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(7, 0, 0, 0)),
                  Text(
                    _getWeek(),
                    style: _weekTextStyle,
                  ),
                ],
              ),
            ),
            // 显示天气
            IconButton(
              // TODO:动态变化图标
              icon: Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              onPressed: () async {
                if(county == "") { // 未选择地址
                  // Toast.toast(context, "请先选择地址");
                  getProvinces(context);
                }
                else { // 已选择地址
                  _openTopReminderCallback(context);
                }
              }
            ),
            // 显示搜索
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () async {
                // TODO:实现搜索功能
                Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
              },
            ),
          ],
          elevation: 0.0,
        ),
        body: _bodys[_tabIndex],
        bottomNavigationBar: _buildBottomNavigatorButtons(),
        drawer: DrawerPage(
          oriAvatar: _avatar,
          oriNickname: _nickname,
          oriEmail: _email,
          oriPassword: _password,
        ),
        floatingActionButton: _isEdit ? Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 40, 20),
            child: FloatingActionButton(
              child: Icon(
                Icons.chrome_reader_mode,
                size: 45,
                color: Colors.white,
              ),
              onPressed: _openCardPacketCallback,
              backgroundColor: Colors.blue[300],
            )
        ) : null,
        // resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
        /*new Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 40, 20),
          child: new CircleAvatar(
            radius:30,
            child: IconButton(
              icon: new Icon(
                Icons.chrome_reader_mode,
                size: 45,
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              onPressed: _openCardPacketCallback,
            ),
            backgroundColor: Colors.black54,
          ),
        )*/
      )
    );
  }
}
