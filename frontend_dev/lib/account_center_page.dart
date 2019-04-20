import 'package:flutter/material.dart';

typedef void ChangeCallback(String value);

class AccountCenterPage extends StatefulWidget {
  AccountCenterPage({this.oriNickname, this.oriEmail, this.oriAvatar});
  String oriAvatar; // 头像
  String oriNickname; // 昵称
  String oriEmail; // 邮箱

  @override
  _AccountCenterPageState createState() => _AccountCenterPageState();
}

class _AccountCenterPageState extends State<AccountCenterPage> {
  final GlobalKey<_AccountCenterPageState> _accountCenterPageKey =
    new GlobalKey<_AccountCenterPageState>();

  // 初始化微信、QQ、微博图标
  List<IconButton> oriAccounts = [
    IconButton( // Wechat图标
      icon: Icon(IconData(
        0xe627,
        fontFamily: 'Accounts',
      )),
      onPressed: _wechatAccountChangeCallback,
    ),
    IconButton( // QQ图标
      icon: Icon(IconData(
        0xe630,
        fontFamily: 'Accounts',
      )),
      onPressed: _qqAccountChangeCallback,
    ),
    IconButton( // Weibo图标
      icon: Icon(IconData(
        0xe620,
        fontFamily: 'Accounts',
      )),
      onPressed: _weiboAccountChangeCallback,
    ),
  ]; // 原绑定

  TextEditingController nicknameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  static VoidCallback _avatarChangeCallback; // 更改头像
  static ChangeCallback _nicknameChangeCallback; // 更改昵称
  static ChangeCallback _emailChangeCallback; // 更改邮箱
  static VoidCallback _wechatAccountChangeCallback; // 更改微信
  static VoidCallback _qqAccountChangeCallback; // 更改QQ
  static VoidCallback _weiboAccountChangeCallback; // 更改微博

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            color: Colors.black,
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
    /// TODO:细化校验标准
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
          controller: nicknameController,
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
            var emailReg = RegExp(
                r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
            if (!emailReg.hasMatch(value)) {
              return '请输入正确的邮箱地址';
            }
          },
          // TODO:有点小问题，回调好像没启动
          onSaved: _emailChangeCallback,
          controller: emailController,
        )
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

    /// TODO:更改头像
    _avatarChangeCallback = () {
      setState(() {
        // ...
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

    /// TODO:更改微信
    _wechatAccountChangeCallback = () {
      setState(() {
        // ...
      });
    };

    /// TODO:更改QQ
    _qqAccountChangeCallback = () {
      setState(() {
        // ...
      });
    };

    /// TODO:更改微博
    _weiboAccountChangeCallback = () {
      setState(() {
        // ...
      });
    };

    return Scaffold(
      // TODO: 统一文字图标颜色
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        children: <Widget>[
          // 个人中心标题
          SizedBox(height: kToolbarHeight),
          buildTitle('Account'),
          buildTitleLine(),
          SizedBox(height: 20.0),

          // TODO:加个铅笔修改图案
          // TODO:加个性别选择图案
          // 点击更改头像
          SizedBox(height: 50),
          buildAvatar(),
          SizedBox(height: 30),

          // 深黑色分割线
          // Divider(color: Colors.black),

          // 点击更改昵称
          buildNicknameListTile(),
          Divider(),

          // 点击更改邮箱
          buildEmailListTile(),
          Divider(),

          // 点击更改绑定
          buildAccountsListTile(),
          Divider(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}