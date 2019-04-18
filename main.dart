import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My page with drawer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue, //主题色
      ),
      home: MyHomePage(title: 'Example homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final nickname = '三花';
  final email = '8888@qq.com';


  //produce the text for Text widget

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


    //Account页面
    MaterialPageRoute _account = new MaterialPageRoute(
      builder: (context) => new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.blue,
            title: new Text('Hello $nickname'),
          ),
          backgroundColor: Colors.white,
          body: new ListView(
            children: <Widget>[
              new Image.asset('images/account.jfif',
                height: 50,
              ),
              new Divider(color: Colors.amber,),
              new ListTile(
                title: new Text('nickname: $nickname'),
              ),
              new Divider(),
              new ListTile(
                title: new Text('E-mail: $email'),
              )
            ],
          )
      )
    );



    //Drawer侧边栏
    Widget _buildDrawer(){
      return new Drawer(
        child: new Scaffold(
            body: new Stack(
              children: <Widget>[
                new Align(
                  alignment: FractionalOffset.topCenter,
                  child: new ListView(
                    children: <Widget>[
                      new UserAccountsDrawerHeader( //Material内置控件,
                        accountName: new Text('三花'),
                        accountEmail: new Text('8888@qq.com'),
                        currentAccountPicture: new GestureDetector(
                          onTap: () => print('current user'),
                          child: new CircleAvatar(
                            backgroundImage: new AssetImage('images/account.jfif'),
                          ),
                        ),
                      ),
                      new ListTile(
                          leading: new CircleAvatar(child: new Icon(Icons.account_circle),),
                          title: new Text('Your Acount'),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(_account); //_drawer的生成要在_account的生成之后
                          }),
                      new ListTile(
                        leading: new CircleAvatar(child: new Icon(Icons.search),),
                        title: new Text('Second page'),
                      ),
                      new AboutListTile(
                        icon: new CircleAvatar(child: new Icon(Icons.question_answer),),
                        child: new Text('About'),
                        applicationName: 'test',
                        applicationVersion: '0.1.1',
                        //applicationIcon: ,
                      ),
                      new Divider(),
                      //"Close"ListTile
                      new ListTile(
                        leading: new CircleAvatar(child: new Icon(Icons.exit_to_app),),
                        title: new Text('Close'),
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                      )

                    ],
                  ),
                ),
                new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: new Text('Hello $nickname',
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,),
                  ),
                )
              ],
            )
        ),
      );
    }

    //正式返回内容
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Hello there!',
              style: new TextStyle(
                fontSize: 60,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(),
    );
  }
}
