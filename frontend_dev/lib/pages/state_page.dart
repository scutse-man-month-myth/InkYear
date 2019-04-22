import 'package:flutter/material.dart';
import 'dart:math';

//个人状态的参数
// TODO: 变成构造函数参数输入
int maxState = 100;
int currentState = 78;
String cartoonName = "Ponyta-H85";
int maxDegree = 100;
int currentDegree = 57;
int accumulateDayNum = 15;
int dState = 5;
int accumulateCardNum = 28;
Color weatherPageColor = Colors.white;

class DailyRecord extends StatefulWidget{
  State<StatefulWidget> createState(){
    return new DailyRecordState();
  }
}
class DailyRecordState extends State<DailyRecord>{

  int maximumSleep = 100;
  int maximumHunger = 100;
  int maximumMood = 100;
  int maximumStudy = 100;
  int maximumSport =100;
  int currentSleep = 80;
  int currentHunger = 80;
  int currentMood = 80;
  int currentStudy = 80;
  int currentSport = 80;

  Widget build(BuildContext context){
    return new CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        //滑动不动头部
        new SliverPersistentHeader(
          delegate: _SliverAppBarDelegate(
              minHeight: 280,
              maxHeight: 280,
              child: new Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  //小人
                  new Positioned(
                    top: 40,
                    left: (MediaQuery.of(context).size.width - 250) / 2.0,
                    child:  new Container(
                      height: 250,
                      width: 250,
                      child: new Image.asset("imgs/person.png"),
                    ),
                  ),
                  //半圆进度条
                  new Positioned(
                      top: 60,
                      left: (MediaQuery.of(context).size.width - 340) / 2.0,
                      child: new Transform.rotate(
                          child: new GradientCircularProgressIndicator(
                            stokeWidth: 6,
                            radius: 170,
                            colors: [Colors.lightBlueAccent, Colors.lightBlueAccent],
                            totalAngle: pi,
                            value: currentState / maxState,
                            backgroundColor: Colors.white70,
                            strokeCapRound: true,
                          ),
                          angle: 3 * pi / 2.0)
                  ),
                  //总状态Text
                  new Positioned(
                      top: 15,
                      left: (MediaQuery.of(context).size.width - 150) / 2.0,
                      child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: new Text("State",style: TextStyle(fontSize: 20,
                                  color: Colors.white, fontWeight: FontWeight.w500),),
                            ),
                            new Text("$currentState/$maxState", style: TextStyle(fontSize: 30,
                                color: Colors.white, fontWeight: FontWeight.w500), ),
                          ]
                      )
                  )
                ],
              )
          ),
          pinned: true,
        ),
        //滑动动的底部
        new SliverPadding(
          padding: const EdgeInsets.all(0.0),
          sliver: new SliverList(
              delegate: SliverChildListDelegate(
                  <Widget>[
                    new Container(
                      //color: Color.fromRGBO(251, 222, 224, 1),
                      padding: EdgeInsets.all(10.0),
                      child:
                      new Column(
                        children: <Widget>[
                          new SizedBox(
                            width: 400,
                            height: 550,
                            child: new Card(
                              elevation: 5.0,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              child: new Column(
                                children: <Widget>[
                                  new Container(
                                    padding: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width -230) / 2.0, 25, 0, 5),
                                    child: new Row(
                                      children: <Widget>[
                                        new Text(cartoonName, style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),),
                                        new IconButton(icon: new Icon(Icons.brush), onPressed: null)
                                      ],
                                    ),
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Container(
                                        padding: EdgeInsets.fromLTRB(80, 0, 80, 10),
                                        child: new LinearProgressIndicator(value: currentDegree/maxDegree),
                                      ),
                                      new Text("LEVEL $currentDegree/$maxDegree", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  new Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 15)),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new Column(
                                        children: <Widget>[
                                          new Text("$accumulateDayNum天", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
                                          new Text("累计天数",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.blueGrey),)
                                        ],
                                      ),
                                      new SizedBox(
                                        height: 40,
                                        width: 0.1,
                                        child: new Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey)
                                          ),
                                        ),
                                      ),
                                      new Column(
                                        children: <Widget>[
                                          new Row(
                                            children: <Widget>[
                                              new Icon(Icons.add_circle, color: Colors.green,),
                                              new Text("$dState", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),),
                                            ],
                                          ),
                                          new Text("状态变化",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.blueGrey),)
                                        ],
                                      ),
                                      new SizedBox(
                                        height: 40,
                                        width: 0.1,
                                        child: new Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey)
                                          ),
                                        ),
                                      ),
                                      new Column(
                                        children: <Widget>[
                                          new Text("$accumulateCardNum张", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
                                          new Text("累计卡片",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.blueGrey),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  //分隔符
                                  new Container(
                                    padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                                    child: new Divider(
                                      height: 2,
                                      color: Colors.black,
                                    ),
                                  ),

                                  new Container(
                                      padding: EdgeInsets.fromLTRB(30, 20, 50, 30),
                                      child: new Column(
                                        children: <Widget>[
                                          new Row(
                                            children: <Widget>[
                                              new Container(
                                                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                                  child: new Icon(Icons.hotel, size: 35,)
                                              ),
                                              new Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
                                              new Expanded(
                                                  child:new Column(
                                                    children: <Widget>[
                                                      _getNameText(context, '健康（$currentSleep/$maximumSleep）'),
                                                      new LinearProgressIndicator(value: currentSleep/maximumSleep),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                          new Row(
                                            children: <Widget>[
                                              new Container(
                                                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                                  child: new Icon(Icons.local_dining, size: 35,)
                                              ),
                                              new Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
                                              new Expanded(
                                                  child:new Column(
                                                    children: <Widget>[
                                                      _getNameText(context, '饥饿（$currentHunger/$maximumHunger）'),
                                                      new LinearProgressIndicator(value: currentHunger/maximumHunger),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                          new Row(
                                            children: <Widget>[
                                              new Container(
                                                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                                  child: new Icon(Icons.favorite, size: 35,)
                                              ),
                                              new Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
                                              new Expanded(
                                                  child:new Column(
                                                    children: <Widget>[
                                                      _getNameText(context, '心情（$currentMood/$maximumMood）'),
                                                      new LinearProgressIndicator(value: currentMood/maximumMood),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                          new Row(
                                            children: <Widget>[
                                              new Container(
                                                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                                  child: new Icon(Icons.brush, size: 35,)
                                              ),
                                              new Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
                                              new Expanded(
                                                  child:new Column(
                                                    children: <Widget>[
                                                      _getNameText(context, '学习（$currentStudy/$maximumStudy）'),
                                                      new LinearProgressIndicator(value: currentStudy/maximumStudy),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                          new Row(
                                            children: <Widget>[
                                              new Container(
                                                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                                  child: new Icon(Icons.directions_run, size: 35,)
                                              ),
                                              new Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
                                              new Expanded(
                                                  child:new Column(
                                                    children: <Widget>[
                                                      _getNameText(context, '心情（$currentSport/$maximumSport）'),
                                                      new LinearProgressIndicator(value: currentSport/maximumSport),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]
              )
          ),
        )
      ],
    );
  }

  Align _getNameText(BuildContext context, String text) {
    return new Align(
        alignment: FractionalOffset.topLeft,
        child: new Text(
            text,
            style: new TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              height: 1.5,
            )
        )
    );
  }

  // TODO:暂时还未用到
  /*_verticalDivider() => BoxDecoration(
    border: Border(
      right: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 0.5,
      ),
    ),
  );*/
}

/*个人状态页面的顶部不滑动头部*/
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

/*自定义曲线进度条控件*/
class GradientCircularProgressIndicator extends StatelessWidget {
  GradientCircularProgressIndicator({
    this.stokeWidth = 2.0,
    @required this.radius,
    @required this.colors,
    this.stops,
    this.strokeCapRound = false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle = 2 * pi,
    this.value
  });

  ///粗细
  final double stokeWidth;

  /// 圆的半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度，取值范围 [0.0-1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色的终止点，对应colors属性
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    if (strokeCapRound) {
      _offset = asin(stokeWidth / (radius * 2 - stokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme
          .of(context)
          .accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
          size: Size.fromRadius(radius),
          painter: _GradientCircularProgressPainter(
            stokeWidth: stokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: _colors,
          )
      ),
    );
  }
}
//实现画笔
class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({
    this.stokeWidth: 10.0,
    this.strokeCapRound: false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.radius,
    this.total = 2 * pi,
    @required this.colors,
    this.stops,
    this.value
  });

  final double stokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = stokeWidth / 2.0;
    double _value = (value ?? .0);
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(stokeWidth/ (size.width - stokeWidth));
    }

    Rect rect = Offset(_offset, _offset) & Size(
        size.width - stokeWidth,
        size.height - stokeWidth
    );

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = stokeWidth;

    // 先画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(
          rect,
          _start,
          total,
          false,
          paint
      );
    }

    // 再画前景，应用渐变
    if (_value > 0) {
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(
          rect,
          _start,
          _value,
          false,
          paint
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}