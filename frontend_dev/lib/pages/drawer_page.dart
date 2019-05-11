import 'package:flutter/material.dart';
import 'package:frontend_dev/constants/SourceImages.dart';
import 'package:frontend_dev/pages/login_page.dart';
import 'package:frontend_dev/pages/account_center_page.dart';
import 'package:frontend_dev/pages/tag_list_page.dart';
import 'package:frontend_dev/widgets/Toast.dart';


class DrawerPage extends StatefulWidget {
  DrawerPage({this.oriNickname, this.oriEmail, this.oriAvatar, this.oriPassword});
  String oriAvatar; // 头像
  String oriNickname; // 昵称
  String oriEmail; // 邮箱
  String oriPassword; // 密码

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  bool _isLogin = false; // 登录状态

  @override
  Widget build(BuildContext context) {
    VoidCallback _accountSwitchCallback; // 切换账户
    VoidCallback _enterAccountCenter;  // 进入个人中心
    VoidCallback _enterTagList; // 进入标签分类
    VoidCallback _enterExportData;  // 进入导出数据
    VoidCallback _enterAdvancedFeatures; // 进入高级功能
    VoidCallback _enterUsageGuide; // 进入使用指南

    /// 登录页面
    MaterialPageRoute _buildLoginPage() {
      return MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
    }

    /// 个人中心页面
    MaterialPageRoute _buildAccountCenterPage(String avatar, String nickname, String email, String password) {
      return MaterialPageRoute(
        builder: (context) => AccountCenterPage(
          oriAvatar: avatar,
          oriNickname: nickname,
          oriEmail: email,
          oriPassword: password,
        ),
      );
    }

    /// 标签分类页面
    MaterialPageRoute _buildTagListPage() {
      return MaterialPageRoute(
        builder: (context) => TagListPage(),
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
      Navigator.of(context).push(_buildAccountCenterPage(widget.oriAvatar, widget.oriNickname, widget.oriEmail, widget.oriPassword));
    };

    /// 进入标签分类
    _enterTagList = () {
      Navigator.of(context).push(_buildTagListPage());
    };

    /// 进入导入数据
    _enterExportData = () {
      // TODO: 完善功能
      Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
    };

    /// 进入高级功能
    _enterAdvancedFeatures = () {
      // TODO: 完善功能
      Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
    };

    /// 进入使用指南
    _enterUsageGuide = () {
      // TODO: 完善功能
      Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
    };

    return Drawer(
      child: new Scaffold(
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
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.blue[300],
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
                        backgroundColor: Colors.blue[300],
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
                        backgroundColor: Colors.blue[300],
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
                        backgroundColor: Colors.blue[300],
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
                        backgroundColor: Colors.blue[300],
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
                        backgroundColor: Colors.blue[300],
                      ),
                      child: Text('关于我们'),
                      // 应用介绍
                      applicationName: '墨年 InkYear',
                      applicationVersion: '1.0.0',
                      /*applicationIcon: Icon(
                        Icons.apps,
                        color: Theme.of(context).iconTheme.color,
                      ),*/
                      applicationIcon: ImageIcon(AssetImage(SourceImages.logo)),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.settings, color: Colors.blue[300]),
                            SizedBox(width: 5),
                            Text('设置'),
                          ],
                        ),
                      ),
                      onTap: () {
                        // TODO: 跳转路由
                        Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
                      },
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.color_lens, color: Colors.blue[300]),
                            SizedBox(width: 5),
                            Text('主题'),
                          ],
                        ),
                      ),
                      onTap: () {
                        // TODO: 跳转路由
                        Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
                      },
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.brightness_2, color: Colors.blue[300]),
                            SizedBox(width: 5),
                            Text('夜间'),
                          ],
                        ),
                      ),
                      onTap: () {
                        // TODO: 跳转路由
                        Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
                      },
                    ),
                  ],
                ),
              ),


            ],
          )
      ),
    );
  }
}
