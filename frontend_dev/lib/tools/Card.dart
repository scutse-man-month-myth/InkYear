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
          decoration: new BoxDecoration(
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black54,//阴影颜色
                blurRadius: 10.0,//阴影大小
                offset: Offset(10.0, 10.0)
              ),
            ],
            color: widget.color,
          ),
          height: 4.5 * widget.cardSize,
          width: 2.9 * widget.cardSize,
          margin: EdgeInsets.all(0),
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
    this.child, this.cardSize = 60, this.color = Colors.white
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
            decoration: new BoxDecoration(
              boxShadow: <BoxShadow>[
                new BoxShadow(

                    color: Colors.black54,//阴影颜色
                    blurRadius: 10.0,//阴影大小
                    offset: Offset(10.0, 10.0)
                ),
              ],
              color: widget.color,
            ),
            height: 4.5 * widget.cardSize,
            width: 2.9 * widget.cardSize,
            margin: EdgeInsets.all(0),
            child: widget.child,
          )
        ],
      ),
      onTap: _chooseCardCallback,
    );
  }
}

