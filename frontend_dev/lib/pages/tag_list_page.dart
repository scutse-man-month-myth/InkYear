import 'package:flutter/material.dart';

class TagListPage extends StatelessWidget {
  Widget build(BuildContext context) {

    Widget _createTag(IconData iconData, String titleText) {
      return Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
        child: ListTile(
          leading: Icon(iconData, color: Colors.black),
          title: Text(
            titleText,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onTap: () {
            // TODO: 跳转路由
          },
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
          color: Theme
              .of(context)
              .backgroundColor,
          /*image: DecorationImage(
            image: AssetImage("imgs/background2.jpg"),
            fit: BoxFit.fitWidth,
          )*/
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
            title: Text(
              "标签分类",
              style: TextStyle(
                color:Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          body: ListView(
              children: <Widget>[
                _createTag(Icons.favorite, '佛系'),
                _createTag(Icons.accessibility_new, '养生'),
                _createTag(Icons.build, '技能'),
                _createTag(Icons.brush, '素养'),
                /*_createTag(Icons.language, '足迹'),
                _createTag(Icons.dashboard, '印象'),*/
                _createTag(Icons.all_inclusive, '其它'),
              ],
          )
      ),
    );
  }
}