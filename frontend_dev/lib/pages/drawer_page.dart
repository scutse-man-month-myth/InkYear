import 'package:flutter/material.dart';
import 'package:frontend_dev/pages/login_page.dart';
import 'package:frontend_dev/pages/account_center_page.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO:_accountSwitchCallback
    VoidCallback _accountSwitchCallback; // 切换账户
    // TODO:_enterAccountCenter
    VoidCallback _enterAccountCenter;  // 进入个人中心
    // TODO:_enterTagList
    VoidCallback _enterTagList; // 进入标签分类
    // TODO:_enterExportData
    VoidCallback _enterExportData;  // 进入导出数据
    // TODO:_enterAdvancedFeatures
    VoidCallback _enterAdvancedFeatures; // 进入高级功能
    // TODO:_enterUsageGuide
    VoidCallback _enterUsageGuide; // 进入使用指南

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
        Navigator.of(context).push(_buildLoginPage());
      }
      else { // 切换or退出
        // TODO:_accountSwitchCallback退出
      }
    };

    /// 进入个人中心
    _enterAccountCenter = () {
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
                      accountName: Text('${widget.oriNickname}'), // 昵称
                      accountEmail: Text('${widget.oriEmail}'), // 邮箱
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
                          color: Theme.of(context).accentColor,
                        ),
                        backgroundColor: Theme.of(context).iconTheme.color,
                      ),
                      title: Text('个人中心'),
                      onTap: _enterAccountCenter,
                    ),
                    // 标签分类
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.featured_play_list,
                          color: Theme.of(context).accentColor,
                        ),
                        backgroundColor: Theme.of(context).iconTheme.color,
                      ),
                      title: Text('标签分类'),
                      onTap: _enterTagList,
                    ),
                    // 导出数据
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.import_export,
                          color: Theme.of(context).accentColor,
                        ),
                        backgroundColor: Theme.of(context).iconTheme.color,
                      ),
                      title: Text('导出数据'),
                      onTap: _enterExportData,
                    ),
                    // 高级功能
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.cloud_upload,
                          color: Theme.of(context).accentColor,
                        ),
                        backgroundColor: Theme.of(context).iconTheme.color,
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
                          color: Theme.of(context).accentColor,
                        ),
                        backgroundColor: Theme.of(context).iconTheme.color,
                      ),
                      title: Text('使用指南'),
                      onTap: _enterUsageGuide,
                    ),
                    // 关于我们
                    AboutListTile(
                      // TODO:选项字体颜色调整
                      icon: CircleAvatar(
                        child: Icon(
                          Icons.thumb_up,
                          color: Theme.of(context).accentColor,
                        ),
                        backgroundColor: Theme.of(context).iconTheme.color,
                      ),
                      child: Text('关于我们'),
                      // 应用介绍
                      applicationName: '墨年 InkYear',
                      applicationVersion: '0.0.1',
                      applicationIcon: Icon(
                        Icons.apps,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      // 团队介绍
                      aboutBoxChildren: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.people,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          title: Text('SCUTSE Man-Month Myth'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          title: Text('lottewong21@gmail.com'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.link,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          title: Text('https://github.com/scutse-man-month-myth/InkYear'),
                        )
                      ],
                    ),

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
