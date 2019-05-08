import 'package:flutter/material.dart';
import 'package:frontend_dev/constants/AntDesignIcons.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _nickname, _email, _password;
  bool _isObscure = true;
  Color _eyeColor;
  List _loginMethod = [
    {
      "title": "Wechat",
      "icon": AntDesignIcons.wechat,
    }, // Login via Wechat
    {
      "title": "QQ",
      "icon": AntDesignIcons.qq,
    }, // Login via QQ
    {
      "title": "Weibo",
      "icon": AntDesignIcons.weibo,
    }, // Login via Weibo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(height: kToolbarHeight),
                buildTitle('Register'),
                buildTitleLine(),
                SizedBox(height: 70.0),
                buildNicknameTextField(),
                SizedBox(height: 30.0),
                buildEmailTextField(),
                SizedBox(height: 30.0),
                buildPasswordTextField(context),
                SizedBox(height: 60.0),
                buildRegisterButton(context),
                SizedBox(height: 30.0),
                buildOtherLoginText(),
                buildOtherMethodIcon(context),
              ],
            ),
          ),
        )
    );
  }

  Padding buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

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

  TextFormField buildNicknameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nickname',
      ),
      validator: (String value) {
        // TODO: 昵称有效验证
      },
      onSaved: (String value) => _nickname = value,
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(value)) {
          return '请输入正确的邮箱地址';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  Align buildRegisterButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            'Register',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.black,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              print('nickname:$_nickname, email:$_email , password:$_password');
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  Align buildOtherLoginText() {
    return Align(
        alignment: Alignment.center,
        child: Text(
          '其他账号登录',
          style: TextStyle(color: Colors.grey, fontSize: 14.0),
        ));
  }

  ButtonBar buildOtherMethodIcon(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: _loginMethod
          .map((item) => Builder(
        builder: (context) {
          return IconButton(
              icon: Icon(item['icon'],
                  color: Theme.of(context).iconTheme.color),
              onPressed: () {
                //TODO : 第三方登录方法
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("${item['title']}登录"),
                  action: new SnackBarAction(
                    label: "取消",
                    onPressed: () {},
                  ),
                ));
              });
        },
      ))
          .toList(),
    );
  }

}

