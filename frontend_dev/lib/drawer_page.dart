import 'package:flutter/material.dart';
import 'package:frontend_dev/login_page.dart';
import 'package:frontend_dev/account_center_page.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({this.oriNickname, this.oriEmail, this.oriAvatar});
  String oriAvatar; // 头像
  String oriNickname; // 昵称
  String oriEmail; // 邮箱

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  bool _isLogin = false; // 登录状态

  // TODO:_accountSwitchCallback
  static VoidCallback _accountSwitchCallback; // 切换账户
  // TODO:_enterAccountCenter
  static VoidCallback _enterAccountCenter;  // 进入个人中心
  // TODO:_enterTagList
  static VoidCallback _enterTagList; // 进入标签分类
  // TODO:_enterExportData
  static VoidCallback _enterExportData;  // 进入导出数据
  // TODO:_enterAdvancedFeatures
  static VoidCallback _enterAdvancedFeatures; // 进入高级功能
  // TODO:_enterUsageGuide
  static VoidCallback _enterUsageGuide; // 进入使用指南

  @override
  Widget build(BuildContext context) {
    /// TODO:注册页面

    /// 登录页面
    MaterialPageRoute _buildLoginPage() {
      return MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
    }

    /// 个人中心页面
    MaterialPageRoute _buildAccountCenterPage(String avatar, String nickname, String email) {
      return MaterialPageRoute(
        builder: (context) => AccountCenterPage(
          oriAvatar: avatar,
          oriNickname: nickname,
          oriEmail: email,
        ),
      );
    }

    /// 切换账户
    _accountSwitchCallback = () {
      if(!_isLogin) { // 登录or注册
        Navigator.of(context).pop();
        Navigator.of(context).push(_buildLoginPage());
      }
      else { // 切换or退出
        // TODO:_accountSwitchCallback退出
      }
    };

    /// 进入个人中心
    _enterAccountCenter = () {
      // TODO:_drawer的生成要在_account的生成之后
      Navigator.of(context).pop();
      Navigator.of(context).push(_buildAccountCenterPage(widget.oriAvatar, widget.oriNickname, widget.oriEmail));
    };

    return Drawer(
      child: new Scaffold(
        // TODO:用Stack不用Column
          body: Stack(
            children: <Widget>[
              // 主要选项
              Align(
                alignment: Alignment.topCenter,
                child: ListView(
                  children: <Widget>[
                    // 用户头像
                    UserAccountsDrawerHeader(
                      accountName: Text('${widget.oriAvatar}'), // 昵称
                      accountEmail: Text('${widget.oriNickname}'), // 邮箱
                      currentAccountPicture: GestureDetector(
                        onTap: _accountSwitchCallback,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(widget.oriAvatar),
                        ),
                      )
                    ),

                    Divider(),

                    // 个人中心
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      ),
                      title: Text('个人中心'),
                      onTap: _enterAccountCenter,
                    ),
                    // 标签分类
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.featured_play_list,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      ),
                      title: Text('标签分类'),
                      onTap: _enterTagList,
                    ),
                    // 导出数据
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.import_export,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      ),
                      title: Text('导出数据'),
                      onTap: _enterExportData,
                    ),
                    // 高级功能
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.cloud_upload,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      ),
                      title: Text('高级功能'),
                      onTap: _enterAdvancedFeatures,
                    ),

                    Divider(),

                    // 使用指南
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      ),
                      title: Text('使用指南'),
                      onTap: _enterUsageGuide,
                    ),
                    // 关于我们
                    AboutListTile(
                      icon: CircleAvatar(
                        child: Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: Text('关于我们'),
                      // 应用介绍
                      applicationName: '墨年\tInkYear',
                      applicationVersion: '0.0.1',
                      applicationIcon: Icon(
                        Icons.apps,
                        color: Colors.black,
                      ),
                      // 团队介绍
                      aboutBoxChildren: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.people,
                            color: Colors.black,
                          ),
                          title: Text('SCUTSE Man-Month Myth'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          title: Text('lottewong21@gmail.com'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.link,
                            color: Colors.black,
                          ),
                          title: Text('https://github.com/scutse-man-month-myth/InkYear'),
                        )
                      ],
                    ),

                    Divider(),
                  ],
                ),
              ),

              // 次要选项
              // TODO:仿照B站底部三个图标-设置/主题/夜间

            ],
          )
      ),
    );
  }
}
