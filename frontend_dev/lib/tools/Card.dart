import 'package:flutter/material.dart';
import 'Tag.dart';

//主页面的卡片类
class MainCard extends StatefulWidget{
  double cardSize;
  Widget child;
  Color color;
  String title;
  MainCard({
    this.child, this.title, this.cardSize = 100, this.color = Colors.white
  });

  State<StatefulWidget> createState(){
    return new MainCardState();
  }
}
class MainCardState extends State<MainCard>{
  Widget build(BuildContext context){
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new MainTag(
          size: widget.cardSize,
          color: widget.color,
        ),
        new Container(
          height: 4.3 * widget.cardSize,
          width: 3 * widget.cardSize,
          margin: EdgeInsets.all(0),
          color: widget.color,
          child: widget.child,
        )
      ],
    );
  }
}

//卡包页面的卡片类
class SelectCard extends StatefulWidget{
  double cardSize;
  Widget child;
  Color color;
  SelectCard({
    this.child, this.cardSize = 50, this.color = Colors.white
  });

  State<StatefulWidget> createState(){
    return new SelectCardState();
  }
}
class SelectCardState extends State<SelectCard>{

  //选择卡片后返回到主页面
  static VoidCallback _chooseCardCallback;

  Widget build(BuildContext context){
    _chooseCardCallback = (){
      Navigator.pop(context);
    };
    return new GestureDetector(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new SelectTag(
            size: widget.cardSize,
            color: widget.color,
          ),
          new Container(
            height: 4 * widget.cardSize,
            width: 3 * widget.cardSize,
            margin: EdgeInsets.all(0),
            color: widget.color,
            child: widget.child,
          )
        ],
      ),
      onTap: _chooseCardCallback,
    );
  }
}