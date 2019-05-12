import 'package:flutter/material.dart';
import 'package:frontend_dev/widgets/Toast.dart';
import 'package:frontend_dev/pages/swiper_page.dart';
import 'package:frontend_dev/pages/snaplist_page.dart';
import 'package:frontend_dev/widgets/Card.dart';
import 'package:frontend_dev/pages/card_page.dart';
import 'package:frontend_dev/widgets/CardModel.dart';

class MainTag extends StatefulWidget{
  double size;
  Color color;
  MainTag({
    @required
    this.size, this.color
  });
  State<StatefulWidget> createState(){
    return new MainTagState();
  }
}
class MainTagState extends State<MainTag>{

  //进入看今日写的卡片
  static VoidCallback _seeCardsCallback;

  Widget build(BuildContext context){
    _seeCardsCallback = (){
      /*Navigator.of(context).push(
        /*MaterialPageRoute(
          builder: (BuildContext context) => SnaplistPage(
            widgets: [
              new CardPrototype(child: new BasicCardModel()),
              new CardPrototype(child: new BasicCardModel()),
              new CardPrototype(child: new BasicCardModel()),
            ]
          ),
        ),*/
        PageRouteBuilder(
          // 当前的路由不会遮盖之前的路由
          opaque: false,
          // 构建路由的主要内容
          pageBuilder: (BuildContext context, _, __) => SnaplistPage(
              widgets: [
                MainCard(),
                MainCard(),
                MainCard(),
                // new CardPrototype(child: new BasicCardModel()),
                // new CardPrototype(child: new BasicCardModel()),
                // new CardPrototype(child: new BasicCardModel()),
              ]
          ),
        ),
      );*/
      Navigator.of(context).push(
        PageRouteBuilder(
          // 当前的路由不会遮盖之前的路由
          opaque: false,
          // 构建路由的主要内容
          pageBuilder: (BuildContext context, _, __) => Center(child: SwiperPage()),
        ),
      );
      Toast.toast(context, "click!!!");
    };
    return new GestureDetector(
      child: new Row(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            color: widget.color,
            height: 0.25 * widget.size,
            width: widget.size,
          ),
          new CustomPaint(
            painter: new TriangleCustomPainter(
                context,
                <Coordinate>[
                  new Coordinate(cx:0 , cy: -0.25 * widget.size / 2),
                  new Coordinate(cx:0 , cy: 0.25 * widget.size / 2),
                  new Coordinate(cx: 0.35 * widget.size , cy: 0.25 * widget.size / 2),
                ],
                color: widget.color
            ),
          ),
        ],
      ),
      onTap: _seeCardsCallback,
    );
  }
}

class SelectTag extends StatefulWidget{
  double size;
  Color color;
  SelectTag({
    @required
    this.size, this.color
  });
  State<StatefulWidget> createState(){
    return new SelectTagState();
  }
}
class SelectTagState extends State<SelectTag>{
  Widget build(BuildContext context){
    return new Row(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          color: widget.color,
          height: 0.25 * widget.size,
          width: widget.size,
        ),
        new CustomPaint(
          painter: new TriangleCustomPainter(
              context,
              <Coordinate>[
                new Coordinate(cx:0 , cy: -0.25 * widget.size / 2),
                new Coordinate(cx:0 , cy: 0.25 * widget.size / 2),
                new Coordinate(cx: 0.35 * widget.size , cy: 0.25 * widget.size / 2),
              ],
              color: widget.color
          ),
        ),
      ],
    );
  }
}

//自定义 坐标
class Coordinate {
  final double cx;
  final double cy;
  Coordinate({this.cx, this.cy});
}
//绘制三角形
class TriangleCustomPainter extends CustomPainter {
  Paint _paint = new Paint();//画笔富含各种属性方法。仔细查看源码
  final BuildContext context;
  final List spots;
  final Color color;

  TriangleCustomPainter(this.context, this.spots, {this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path()..moveTo(spots[0].cx, spots[0].cy);
    path.lineTo(spots[1].cx, spots[1].cy);
    path.lineTo(spots[2].cx, spots[2].cy);
    canvas.drawPath(
        path,
        _paint
          ..style = PaintingStyle.fill
          ..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}