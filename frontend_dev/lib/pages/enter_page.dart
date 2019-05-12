import 'package:flutter/material.dart';
import 'package:frontend_dev/constants/SourceImages.dart';
import 'package:frontend_dev/main.dart';
import 'package:frontend_dev/database/database.dart';
import 'package:frontend_dev/database/table_state.dart';
import 'package:frontend_dev/database/table_card.dart';

// TODO: 将这个全局变量写进配置文件
String databaseName = "InkYear";

// TODO: 点击进入和倒计时进入
class EnterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height:250),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                child: Text(
                  'Welcome' + '\n' + 'back :)',
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async{
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => MyHomePage())
                  );
                  // TODO: 测试条目
                  await deleteDB(databaseName);
                  await createDatabase(databaseName);
                  await createStateTable();
                  await createCardTable();
                  //try {
                    await addState();
                    await queryState();
                    // await addBasicCard();
                  //}
                  //catch (e) {
                    print('already initiated');
                  //}
                },
              ),
            )
          ),
          SizedBox(height:20),
          Align(
            // TODO: 对齐左边会更美观
            // alignment: Alignment.topLeft,
            child: Text('进入App >>>'),
          ),
          SizedBox(height: 200),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ImageIcon(AssetImage(SourceImages.logo)),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(SourceImages.logo)),
                  ),
                ),
                SizedBox(width:10),
                Text(
                  '墨年 InkYear',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            )
          ),
        ]
      ),
    );
  }
}
