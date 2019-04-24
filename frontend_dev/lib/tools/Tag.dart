import 'package:flutter/material.dart';
import 'package:frontend_dev/tools/Toast.dart';



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
      Toast.toast(context, "click!!!");
    };
    return new GestureDetector(
      child: new Row(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            color: widget.color,
            height: 0.35 * widget.size,
            width: widget.size,
          ),
          new CustomPaint(
            painter: new TriangleCustomPainter(
                context,
                <Coordinate>[
                  new Coordinate(cx:0 , cy: -0.35 * widget.size / 2),
                  new Coordinate(cx:0 , cy: 0.35 * widget.size / 2),
                  new Coordinate(cx: 0.35 * widget.size , cy: 0.35 * widget.size / 2),
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
          height: 0.30 * widget.size,
          width: widget.size,
        ),
        new CustomPaint(
          painter: new TriangleCustomPainter(
              context,
              <Coordinate>[
                new Coordinate(cx:0 , cy: -0.30 * widget.size / 2),
                new Coordinate(cx:0 , cy: 0.30 * widget.size / 2),
                new Coordinate(cx: 0.35 * widget.size , cy: 0.30 * widget.size / 2),
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