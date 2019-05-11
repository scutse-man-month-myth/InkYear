import 'package:flutter/material.dart';
import 'package:frontend_dev/constants/SourceImages.dart';

class TagListPage extends StatelessWidget {
  Widget build(BuildContext context) {

    Widget _createTag(IconData iconData, String titleText) {
      return Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
        child: ListTile(
          leading: Icon(iconData, color: Colors.white),
          title: Text(
            titleText,
            style: TextStyle(
              color: Colors.white,
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
          image: DecorationImage(
            image: AssetImage(SourceImages.background),
            fit: BoxFit.fitWidth,
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: BackButton(),
            title: Text(
              "标签分类",
              style: TextStyle(
                color:Colors.white,
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
                _createTag(Icons.all_inclusive, '其它'),
              ],
          )
      ),
    );
  }
}