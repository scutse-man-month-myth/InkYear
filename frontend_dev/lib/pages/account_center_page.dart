import 'package:flutter/material.dart';
import 'package:frontend_dev/constants/AntDesignIcons.dart';
import 'package:frontend_dev/widgets/Toast.dart';

typedef void ChangeCallback(String value);

class AccountCenterPage extends StatefulWidget {
  AccountCenterPage({this.oriNickname, this.oriEmail, this.oriAvatar, this.oriPassword});
  String oriAvatar; // 头像
  String oriNickname; // 昵称
  String oriEmail; // 邮箱
  String oriPassword; // 密码

  @override
  _AccountCenterPageState createState() => _AccountCenterPageState();
}

class _AccountCenterPageState extends State<AccountCenterPage> {
  List<IconButton> oriAccounts = []; // 绑定

  TextEditingController _nicknameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback _avatarChangeCallback; // 更改头像
    ChangeCallback _nicknameChangeCallback; // 更改昵称
    ChangeCallback _emailChangeCallback; // 更改邮箱
    ChangeCallback _passwordChangeCallback; // 更改邮箱
    VoidCallback _wechatAccountChangeCallback; // 更改微信
    VoidCallback _qqAccountChangeCallback; // 更改QQ
    VoidCallback _weiboAccountChangeCallback; // 更改微博

    /// TODO:更改头像
    _avatarChangeCallback = () {
      setState(() {
        Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
      });
    };

    /// 更改昵称
    _nicknameChangeCallback = (String value) {
      setState(() {
        widget.oriNickname = value;
        print('newNickname: ${widget.oriNickname}');
      });
    };

    /// 更改邮箱
    _emailChangeCallback = (String value) {
      setState(() {
        widget.oriEmail = value;
        print('newEmail: ${widget.oriEmail}');
      });
    };

    /// 更改密码
    _passwordChangeCallback = (String value) {
      setState(() {
        widget.oriPassword = value;
        print('newEmail: ${widget.oriPassword}');
      });
    };

    /// TODO:更改微信
    _wechatAccountChangeCallback = () {
      setState(() {
        Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
      });
    };

    /// TODO:更改QQ
    _qqAccountChangeCallback = () {
      setState(() {
        Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
      });
    };

    /// TODO:更改微博
    _weiboAccountChangeCallback = () {
      setState(() {
        Toast.toast(context, "功能尚未开放......Orz\n敬请期待吧~(￣▽￣)");
      });
    };

    // 初始化绑定账号的图标列表
    oriAccounts.addAll([
      IconButton( // Wechat图标
        icon: Icon(AntDesignIcons.wechat),
        onPressed: _wechatAccountChangeCallback,
      ),
      IconButton( // QQ图标
        icon: Icon(AntDesignIcons.qq),
        onPressed: _qqAccountChangeCallback,
      ),
      IconButton( // Weibo图标
        icon: Icon(AntDesignIcons.weibo),
        onPressed: _weiboAccountChangeCallback,
      ),
    ]);

    /// 绘制标题
    Padding buildTitle(String title) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 42.0),
        ),
      );
    }

    /// 绘制标题线
    Padding buildTitleLine() {
      return Padding(
        padding: EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Theme.of(context).primaryColor,
            width: 40.0,
            height: 2.0,
          ),
        ),
      );
    }

    /// 绘制头像
    Align buildAvatar() {
      return Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.oriAvatar),
            radius: 50,
          ),
          onTap: _avatarChangeCallback,
        ),
      );
    }

    /// 绘制昵称列表项
    /// TODO:细化检验标准
    ListTile buildNicknameListTile() {
      return ListTile(
        leading: Icon(
          Icons.perm_contact_calendar,
          color: Colors.black,
        ),
        title: TextFormField(
          decoration: InputDecoration(
            hintText: '${widget.oriNickname}',
          ),
          validator: (String value) {
            if (value.length > 20) {
              return '请输入合适长度的昵称';
            }
          },
          // TODO:有点小问题，回调好像没启动
          onSaved: _nicknameChangeCallback,
          controller: _nicknameController,
        )
        // title: Text('Nickname: ${widget.oriNickname}'),
      );
    }

    /// 绘制邮箱列表项
    /// TODO:发送验证链接
    ListTile buildEmailListTile() {
      return ListTile(
        leading: Icon(
          Icons.email,
          color: Colors.black,
        ),
        title: TextFormField(
          decoration: InputDecoration(
            hintText: '${widget.oriEmail}',
          ),
          validator: (String value) {
            RegExp emailReg = RegExp(
                r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
            if (!emailReg.hasMatch(value)) {
              return '请输入正确的邮箱地址';
            }
          },
          // TODO:有点小问题，回调好像没启动
          onSaved: _emailChangeCallback,
          controller: _emailController,
        )
      );
    }

    /// 绘制密码列表项
    /// TODO:剔除特殊字符
    ListTile buildPasswordListTile() {
      return ListTile(
        leading: Icon(
          Icons.code,
          color: Colors.black,
        ),
        title: TextFormField(
            decoration: InputDecoration(
              // TODO:匹配密码长度
              hintText: '··········',
            ),
            obscureText: true,
            validator: (String value) {
              if (value.length > 20) {
                return '请输入合适长度的密码';
              }
            },
            // TODO:有点小问题，回调好像没启动
            onSaved: _passwordChangeCallback,
            controller: _passwordController,
          )
        // title: Text('Password: ${widget.oriPassword}'),
      );
    }

    /// 绘制绑定列表项
    ListTile buildAccountsListTile() {
      return ListTile(
        leading: Icon(
          Icons.question_answer,
          color: Colors.black,
        ),
        title: Row(
            children: <Widget>[
              oriAccounts[0],
              oriAccounts[1],
              oriAccounts[2],
            ]
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[

            // 个人中心标题
            SizedBox(height: kToolbarHeight),
            buildTitle('Account'),
            buildTitleLine(),
            SizedBox(height: 20.0),

            // 点击更改头像
            // TODO:加个铅笔修改图案
            // TODO:加个性别选择图案
            SizedBox(height: 50),
            buildAvatar(),
            SizedBox(height: 30),

            // 点击更改昵称
            buildNicknameListTile(),
            Divider(color: Theme.of(context).backgroundColor),

            // 点击更改邮箱
            buildEmailListTile(),
            Divider(color: Theme.of(context).backgroundColor),

            // 点击更改密码
            buildPasswordListTile(),
            Divider(color: Theme.of(context).backgroundColor),

            // 点击更改绑定
            buildAccountsListTile(),
            Divider(color: Theme.of(context).backgroundColor),

          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
