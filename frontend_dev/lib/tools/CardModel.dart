import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart';

TextStyle tagStyle = TextStyle(color: Colors.blueGrey, fontSize: 10);
TextStyle titleStyle = TextStyle(color: Colors.blueGrey, fontSize: 11);
TextStyle textStyle = TextStyle(color: Colors.blueGrey, fontSize: 8);

class BasicCardModel extends StatefulWidget{
  State<StatefulWidget> createState(){
    return BasicCardModelState();
  }
}

class BasicCardModelState extends State<BasicCardModel>{

  TextStyle _textStyle = new TextStyle(fontSize: 15, color: Colors.black);
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  double value1 = 0.0;
  double value2 = 0.0;


  Widget build(BuildContext context){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("1.背单词",style: _textStyle,),
              new Switch(
                value: this.check1,

                activeColor: Colors.blue,
                onChanged: (bool val) {
                  this.setState(() {
                    this.check1 = !this.check1;
                  });
                },
              )
            ],
          ),
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("2.步道乐跑",style: _textStyle,),
              new Switch(
                value: this.check2,
                activeColor: Colors.blue,
                onChanged: (bool val) {
                  this.setState(() {
                    this.check2 = !this.check2;
                  });
                },
              )
            ],
          ),
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("3.吃早餐",style: _textStyle,),
              new Switch(
                value: this.check3,
                activeColor: Colors.blue,
                onChanged: (bool val) {
                  this.setState(() {
                    this.check3 = !this.check3;
                  });
                },
              )
            ],
          ),
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("4.看小说",style: _textStyle,),
              new Checkbox(
                value: this.check4,
                activeColor: Colors.blue,
                onChanged: (bool val) {
                  this.setState(() {
                    this.check4 = !this.check4;
                  });
                },
              )
            ],
          ),
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text("5.睡眠时间(小时)", style: _textStyle,),
              new Container(
                padding: EdgeInsets.fromLTRB(20, 17, 0, 0),
                width: 250,
                child: new SeekBar(
                  backgroundColor: Colors.lightBlueAccent,
                  progressColor: Colors.blue,
                  progresseight: 10,
                  value: value1,
                  sectionCount: 5,
                  sectionRadius: 5,
                  sectionColor: Colors.red,
                  sectionUnSelecteColor: Colors.red[100],
                  showSectionText: true,
                  sectionTexts: <SectionTextModel>[
                    new SectionTextModel(
                        position: 0,
                        text: "0",
                        progressColor: Colors.blue,
                    ),
                    new SectionTextModel(
                        position: 1,
                        text: "2",
                        progressColor: Colors.blue,
                    ),
                    new SectionTextModel(
                        position: 2,
                        text: "4",
                        progressColor: Colors.blue,
                    ),
                    new SectionTextModel(
                        position: 3,
                        text: "6",
                        progressColor: Colors.blue,
                    ),
                    new SectionTextModel(
                        position: 4,
                        text: "8",
                        progressColor: Colors.blue,
                    ),
                    new SectionTextModel(
                        position: 5,
                        text: ">=10",
                        progressColor: Colors.blue,
                    ),
                  ],
                  sectionTextMarginTop: 2,
                  sectionDecimal: 0,
                  sectionTextColor: Colors.black,
                  sectionSelectTextColor: Colors.red,
                  sectionTextSize: 14,
                  hideBubble: true,
                  bubbleRadius: 15,
                  bubbleColor: Colors.purple,
                  bubbleTextColor: Colors.white,
                  bubbleTextSize: 14,
                  bubbleMargin: -20,
                  afterDragShowSectionText: true,
                  onValueChanged: (progressValue){
                    setState(() {
                        value1 = progressValue.value;
                    });
                  },
                ),
              )
            ],
          )
        ),
        new Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("6.运动时间(分钟)", style: _textStyle,),
                new Container(
                  padding: EdgeInsets.fromLTRB(20, 17, 0, 0),
                  width: 250,
                  child: new SeekBar(
                    backgroundColor: Colors.lightBlueAccent,
                    progressColor: Colors.blue,
                    progresseight: 10,
                    value: value2,
                    sectionCount: 5,
                    sectionRadius: 5,
                    sectionColor: Colors.red,
                    sectionUnSelecteColor: Colors.red[100],
                    showSectionText: true,
                    sectionTextMarginTop: 2,
                    sectionDecimal: 0,
                    sectionTextColor: Colors.black,
                    sectionSelectTextColor: Colors.red,
                    sectionTextSize: 14,
                    sectionTexts: <SectionTextModel>[
                      new SectionTextModel(
                        position: 0,
                        text: "0",
                        progressColor: Colors.blue,
                      ),
                      new SectionTextModel(
                        position: 1,
                        text: "20",
                        progressColor: Colors.blue,
                      ),
                      new SectionTextModel(
                        position: 2,
                        text: "40",
                        progressColor: Colors.blue,
                      ),
                      new SectionTextModel(
                        position: 3,
                        text: "60",
                        progressColor: Colors.blue,
                      ),
                      new SectionTextModel(
                        position: 4,
                        text: "80",
                        progressColor: Colors.blue,
                      ),
                      new SectionTextModel(
                        position: 5,
                        text: ">=100",
                        progressColor: Colors.blue,
                      ),
                    ],
                    hideBubble: true,
                    bubbleRadius: 15,
                    bubbleColor: Colors.purple,
                    bubbleTextColor: Colors.white,
                    bubbleTextSize: 14,
                    bubbleMargin: -20,
                    afterDragShowSectionText: true,
                    onValueChanged: (progressValue){
                      setState(() {
                        value2 = progressValue.value;
                      });
                    },
                  ),
                )
              ],
            )
        ),
      ],
    );
  }
}

class ExtendCardModel1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 250,
      width: 170,
      child:new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Icon(Icons.loyalty,size: 12, color: Colors.blueGrey,),
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("添加标签", style: tagStyle,),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("请输入标题", style: titleStyle,),
            ],
          ),
          new Divider(
            height: 5,
            color: Colors.black,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Icon(Icons.brush,size: 12, color: Colors.black,),
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("让记忆停留此刻...", style: textStyle,)
            ],
          ),
        ],
      ),
    );
  }
}

class ExtendCardModel2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 250,
      width: 170,
      child:new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Icon(Icons.loyalty,size: 12, color: Colors.blueGrey,),
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("添加标签", style: tagStyle,),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("请输入标题", style: titleStyle,),
            ],
          ),
          new Divider(
            height: 7,
            color: Colors.black,
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 4, 0, 0)),
          new GestureDetector(
            child: new Container(
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                border: new Border.all(
                  width: 0.7,
                  color: Colors.black,
                  style: BorderStyle.solid
                ),
                color: Colors.white,
              ),
              child: new Column(
                children: <Widget>[
                  new Icon(Icons.add_circle, color: Colors.grey, size: 40,),
                  new Text("添加图片",style: textStyle,),
                ],
              ),
            ),
            onTap: null,
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 4, 0, 0)),
          new Row(
            children: <Widget>[
              new Icon(Icons.location_on,size: 15,),
              new Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
              new Text("商店位置", style: textStyle,),
            ],
          ),
          new Divider(
            height: 5,
            color: Colors.black,
            indent: 18,
          ),
          new Row(
            children: <Widget>[
              new Text("店名:",style: textStyle,),
              new Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
            ],
          ),
          new Divider(
            height: 5,
            color: Colors.black,
            indent: 18,
          ),
          new Row(
            children: <Widget>[
              new Text("菜式:",style: textStyle,),
              new Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
          new Row(
            children: <Widget>[
              new Text("评价:",style: textStyle,),
              new Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
            ],
          ),
        ],
      ),
    );
  }
}

class ExtendCardModel3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 250,
      width: 170,
      child:new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Icon(Icons.loyalty,size: 12, color: Colors.blueGrey,),
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("添加标签", style: tagStyle,),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("请输入标题", style: titleStyle,),
            ],
          ),
          new Divider(
            height: 5,
            color: Colors.black,
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
          new Row(
            children: <Widget>[
              new Icon(Icons.sentiment_dissatisfied, size: 15,),
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("拔草", style: TextStyle(fontSize: 12, color: Colors.blueGrey, fontWeight: FontWeight.w700),),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
          new Row(
            children: <Widget>[
              new Text("店名:",style: textStyle,),
              new Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
            ],
          ),
          new Divider(
            height: 5,
            color: Colors.black,
            indent: 18,
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          new Row(
            children: <Widget>[
              new Text("原因:",style: textStyle,),
              new Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
            ],
          ),
        ],
      ),
    );
  }
}