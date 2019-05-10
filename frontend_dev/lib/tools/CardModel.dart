import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart';
import 'package:frontend_dev/database/table_card.dart';
import 'package:image_picker/image_picker.dart';

String databaseName = "InkYear";

TextStyle tagStyle = TextStyle(color: Colors.grey, fontSize: 10);
TextStyle titleStyle = TextStyle(color: Colors.grey, fontSize: 12);
TextStyle textStyle = TextStyle(color: Colors.grey, fontSize: 10);
TextStyle hint_textStyle = TextStyle(color: Colors.grey, fontSize: 9);

TextStyle big_titleStyle = TextStyle(color: Colors.grey, fontSize: 16);
TextStyle big_textStyle = TextStyle(color: Colors.grey, fontSize: 14);
TextStyle big_hint_textStyle = TextStyle(color: Colors.grey, fontSize: 12);

class BasicCardModel extends StatefulWidget{
  State<StatefulWidget> createState(){
    return BasicCardModelState();
  }
}

class BasicCardModelState extends State<BasicCardModel>{

  // TextStyle _textStyle = new TextStyle(fontSize: 15, color: Colors.black);
  // String _text = "5.睡眠时间(小时)";
  /*bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;*/
  double value1 = 7;
  double value2 = 0.0;

  /*String title;
  String content;*/

  int current_step = 0;
  List<Step> my_steps = [
    new Step(
        title: new Text("Step 1"), content: new Text("Hello"), isActive: true),
    new Step(
        title: new Text("Step 2"), content: new Text("World"), isActive: true),
    new Step(
        title: new Text("Step 3"),
        content: new Text("Hello World"),
        isActive: true)
  ];

  List<bool> isChecks = [false, false, false];
  List<bool> isSwitchs = [false, false, false];
  List<bool> isStars = [false, false, false, false, false];

  List<bool> isActives = [true, true, true];

  Widget build(BuildContext context){
    /*return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new IconButton(
          icon: Icon(Icons.copyright),
          onPressed: () async {
            createCardTable();
          },
        ),
        TextField(
          onChanged: (String value) {
            setState(() {
              title = value;
            });
            print("title: $title");
          },
        ),
        TextField(
          onChanged: (String value) {
            setState(() {
              content = value;
            });
            print("content: $content");
          },
        ),
        new IconButton(
          icon: Icon(Icons.copyright),
          onPressed: () async {
            addCard(title, content);
          },
        ),
        new IconButton(
          icon: Icon(Icons.copyright),
          onPressed: () async {
            updateCard(title, content);
          },
        ),
        new IconButton(
          icon: Icon(Icons.copyright),
          onPressed: () async {
            queryCard(0);
          },
        ),
        new IconButton(
          icon: Icon(Icons.copyright),
          onPressed: () async {
            deleteDB();
          },
        ),
        /*new Padding(
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
        ),*/
      ],
    );*/

    Widget _buildCheckboxTile(IconData iconData, String title, int index) {
      return Row(
        children: <Widget>[
          Icon(iconData, size: 20),
          SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 17)),
          SizedBox(width: 70),
          Checkbox(
            value: isChecks[index],
            tristate: true,
            checkColor: Colors.white,
            activeColor: Colors.green,
            onChanged: (bool choice) {
              setState(() {
                if(choice == true)
                  isChecks[index] = true;
                else
                  isChecks[index] = false;
              });
            },
          ),
        ],
      );
    }

    Widget _buildFirstStepContent() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildCheckboxTile(Icons.build, '技术深耕', 0),
          _buildCheckboxTile(Icons.brush, '英语阅读', 1),
          _buildCheckboxTile(Icons.accessibility_new, '步道乐跑', 2),
        ],
      );
    }

    Widget _buildSeekbarTile(String content) {
      return new Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // new Text(content, style: _textStyle),
            new Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: new Icon(Icons.hotel, color: Colors.black54, size: 25),
            ),
            new Container(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
              width: 170,
              child: new SeekBar(
                backgroundColor: Colors.black12,
                progressColor: Colors.red,
                progresseight: 5,
                value: value1,
                sectionCount: 5,
                showSectionText: true,
                sectionTexts: <SectionTextModel>[
                  /*new SectionTextModel(
                    position: 0,
                    text: "0",
                    progressColor: Colors.blue,
                  ),*/
                  new SectionTextModel(
                    position: 0,
                    text: "5h-",
                    progressColor: Colors.red,
                  ),
                  new SectionTextModel(
                    position: 1,
                    text: "6h",
                    progressColor: Colors.red,
                  ),
                  new SectionTextModel(
                    position: 2,
                    text: "7h",
                    progressColor: Colors.green,
                  ),
                  new SectionTextModel(
                    position: 3,
                    text: "8h",
                    progressColor: Colors.green,
                  ),
                  new SectionTextModel(
                    position: 4,
                    text: "9h",
                    progressColor: Colors.green,
                  ),
                  new SectionTextModel(
                    position: 5,
                    text: "10h+",
                    progressColor: Colors.black54,
                  ),
                ],
                sectionTextMarginTop: 10,
                sectionDecimal: 0,
                sectionTextColor: Colors.black54,
                sectionSelectTextColor: Colors.black,
                sectionTextSize: 15,
                /*hideBubble: true,
                bubbleRadius: 15,
                bubbleColor: Colors.purple,
                bubbleTextColor: Colors.white,
                bubbleTextSize: 14,
                bubbleMargin: -20,*/
                afterDragShowSectionText: true,
                onValueChanged: (progressValue){
                  setState(() {
                    value1 = progressValue.value;
                  });
                },
              ),
            )
          ],
        );
  }

    Widget _buildSecondStepContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildSeekbarTile("睡眠时间"),
        Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Switch(
                value: isSwitchs[0],
                activeColor: Colors.green,
                inactiveThumbColor: Colors.redAccent,
                inactiveTrackColor: Colors.red[200],
                onChanged: (bool choice) {
                  this.setState(() {
                    isSwitchs[0] = !isSwitchs[0];
                  });
                },
              ),
              SizedBox(width: 10),
              Text('早起'),
              SizedBox(width: 25),
              Switch(
                value: isSwitchs[1],
                activeColor: Colors.green,
                inactiveThumbColor: Colors.redAccent,
                inactiveTrackColor: Colors.red[200],
                onChanged: (bool choice) {
                  this.setState(() {
                    isSwitchs[1] = !isSwitchs[1];
                  });
                },
              ),
              SizedBox(width: 10),
              Text('早睡'),
            ],
          ),
        )
        /*_buildSeekbarTile("喝水杯数"),
        _buildSeekbarTile("久坐时间"),*/
      ],
    );
  }

    Widget _buildStar(int idx) {
      return GestureDetector(
        child: isStars[idx] ? Icon(Icons.star, size: 35) : Icon(Icons.star_border, size: 35),
        onTap: () {
          setState(() {
            isStars[idx] = !isStars[idx];
          });
        },
      );
    }

    Widget _buildThirdStepContent() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Today's Mood: "),
          SizedBox(height: 10),
          // TODO: 改成动态
          Row(
            children: <Widget>[
              Icon(Icons.mood, size: 35),
              SizedBox(width: 15),
              Icon(Icons.mood_bad, size: 35),
              SizedBox(width: 15),
              Icon(Icons.mood, size: 35),
              SizedBox(width: 15),
              Icon(Icons.mood_bad, size: 35),
              SizedBox(width: 15),
              Icon(Icons.mood, size: 35),
            ],
          ),
          SizedBox(height: 10),
          Text("Today's Goods: "),
          TextField(
            decoration: InputDecoration(
              hintText: '一句话记录下开心的事8\nE.g. 胡吃海喝',
            ),
            maxLines: 2,
          ),
          SizedBox(height: 10),
          Text("Today's Bads: "),
          TextField(
            decoration: InputDecoration(
              hintText: '一句话记录下难过的事8(逃\nE.g. 熬夜大赛',
            ),
            maxLines: 2,
          ),
          SizedBox(height: 10),
          Text("Today's Grade: "),
          SizedBox(height: 10),
          // TODO: 改成动态
          Row(
            children: <Widget>[
              /*IconButton(
                icon: isStars[0] ? Icon(Icons.star) : Icon(Icons.star_border),
                onPressed: () {
                  setState(() {
                    isStars[0] = !isStars[0];
                  });
                },
              ),
              // SizedBox(width: 15),
              IconButton(
                icon: isStars[1] ? Icon(Icons.star) : Icon(Icons.star_border),
                onPressed: () {
                  setState(() {
                    isStars[1] = !isStars[1];
                  });
                },
              ),
              // SizedBox(width: 15),
              IconButton(
                icon: isStars[2] ? Icon(Icons.star) : Icon(Icons.star_border),
                onPressed: () {
                  setState(() {
                    isStars[2] = !isStars[2];
                  });
                },
              ),
              // SizedBox(width: 15),
              IconButton(
                icon: isStars[3] ? Icon(Icons.star) : Icon(Icons.star_border),
                onPressed: () {
                  setState(() {
                    isStars[3] = !isStars[3];
                  });
                },
              ),
              // SizedBox(width: 15),
              IconButton(
                icon: isStars[4] ? Icon(Icons.star) : Icon(Icons.star_border),
                onPressed: () {
                  setState(() {
                    isStars[4] = !isStars[4];
                  });
                },
              ),*/
              _buildStar(0),
              SizedBox(width: 13),
              _buildStar(1),
              SizedBox(width: 13),
              _buildStar(2),
              SizedBox(width: 13),
              _buildStar(3),
              SizedBox(width: 13),
              _buildStar(4),
            ],
          ),
        ],
      );
    }

    List<Widget> stepWidgets = [
      _buildFirstStepContent(),
      _buildSecondStepContent(),
    ];

    List<StepState> stepStates = [
      StepState.indexed,
      StepState.indexed,
      StepState.indexed,
    ];

    return Align(
        alignment: Alignment.topCenter,
        child: new Stepper(
            currentStep: this.current_step,
            type: StepperType.vertical,
            steps: <Step>[
              new Step(
                title: new Text('随缘打卡'),
                content: (current_step == 0) ? stepWidgets[0] : SizedBox(height: 1),
                state: stepStates[0],
                isActive: isActives[0],
                subtitle: new Text('√ 吾日三省吾身惹'),
              ),
              new Step(
                title: new Text('朋克养生'),
                content: (current_step == 1) ? stepWidgets[1] : SizedBox(height: 1),
                state: stepStates[1],
                isActive: isActives[1],
                subtitle: new Text('√ 生活不止有枸杞'),
              ),
              new Step(
                title: new Text('佛系度日'),
                content: _buildThirdStepContent(),
                state: stepStates[2],
                isActive: isActives[2],
                subtitle: new Text('√ 乱喝鸡汤三脂高'),
              ),
            ],
          onStepTapped: (step) {
            setState(() {
              current_step = step;
            });
          },
          onStepCancel: () {
            setState(() {
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }
            });
          },
          onStepContinue: () {
            setState(() {
              if (current_step < my_steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
          },
        )
    );
  }
}

class ExtendCardModel1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(16, 18, 10, 10),
      height: 250,
      width: 170,
      child:new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          /*new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Icon(Icons.loyalty,size: 12, color: Colors.blueGrey,),
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("添加标签", style: tagStyle,),
            ],
          ),*/
          new Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("输入标题", style: titleStyle,),
            ],
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: new Divider(
              height: 5,
              color: Colors.grey,
            ),
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 7, 0, 0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("记录你的生活...", style: textStyle,)
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
      height: 230,
      width: 175,
      child:new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          new GestureDetector(
            child: new Container(
              height: 105,
              width: 148,
              decoration: BoxDecoration(
                border: new Border.all(
                    width: 0.7,
                    color: Colors.grey,
                    style: BorderStyle.solid
                ),
                color: Colors.white,
              ),
              child: new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.fromLTRB(0, 17, 0, 0)),
                  new Icon(Icons.add_circle, color: Colors.grey, size: 60,),
                  new Text("添加图片",style: textStyle,),
                ],
              ),
            ),
            onTap: null,
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0)),
          new Row(
            children: <Widget>[
              new Padding(padding: EdgeInsets.fromLTRB(7, 0, 0, 0)),
              new Icon(Icons.account_balance,size: 15,color: Colors.grey,),
              new Padding(padding: EdgeInsets.fromLTRB(36, 0, 0, 0)),
              new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
                  new Text("输入店名", style: hint_textStyle,)
                ],
              ),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0)),
          new Row(
            children: <Widget>[
              new Text("菜式:",style: textStyle,),
              new Padding(padding: EdgeInsets.fromLTRB(3, 0, 0, 0)),
              new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
                  new Text("记录你的美食", style: hint_textStyle,),
                ],
              ),
              new Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
          new Row(
            children: <Widget>[
              new Text("点评:",style: textStyle,),
              new Padding(padding: EdgeInsets.fromLTRB(3, 0, 0, 0)),
              new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
                  new Text("记录你的感受", style: hint_textStyle,),
                ],
              ),
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
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      height: 250,
      width: 170,
      child:new Column(
        children: <Widget>[
          new Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child:  new Text("输入标题", style: titleStyle,)
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                width: 65,
                height: 65,
                color: Colors.grey,
                child: new Center(
                  child: new Icon(Icons.add, color: Colors.white,),
                ),
              ),
              new Container(
                width: 65,
                height: 65,
                color: Colors.grey,
                child: new Center(
                  child: new Icon(Icons.add, color: Colors.white,),
                ),
              ),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                width: 65,
                height: 65,
                color: Colors.grey,
                child: new Center(
                  child: new Icon(Icons.add, color: Colors.white,),
                ),
              ),
              new Container(
                width: 65,
                height: 65,
                color: Colors.grey,
                child: new Center(
                  child: new Icon(Icons.add, color: Colors.white,),
                ),
              ),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                width: 65,
                height: 65,
                color: Colors.grey,
                child: new Center(
                  child: new Icon(Icons.add, color: Colors.white,),
                ),
              ),
              new Container(
                width: 65,
                height: 65,
                color: Colors.grey,
                child: new Center(
                  child: new Icon(Icons.add, color: Colors.white,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ExtendCardModel4 extends StatelessWidget{
  Widget build(BuildContext context){
    return new Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
      height: 250,
      width: 170,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: new Text("输入标题", style: titleStyle,)
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 7, 0, 0)),
          new Container(
            height: 70,
            width: 148,
            decoration: BoxDecoration(
              border: new Border.all(
                  width: 0.7,
                  color: Colors.grey,
                  style: BorderStyle.solid
              ),
              color: Colors.white,
            ),
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.fromLTRB(0, 17, 0, 0)),
                new Icon(Icons.add_circle, color: Colors.grey, size: 35,),
              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(0, 5, 75, 0),
            child: new Text("记录你的生活", style: hint_textStyle,),
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          new Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: new Text("输入标题", style: titleStyle,)
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 7, 0, 0)),
          new Container(
            height: 70,
            width: 148,
            decoration: BoxDecoration(
              border: new Border.all(
                  width: 0.7,
                  color: Colors.grey,
                  style: BorderStyle.solid
              ),
              color: Colors.white,
            ),
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.fromLTRB(0, 17, 0, 0)),
                new Icon(Icons.add_circle, color: Colors.grey, size: 35,),
              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(0, 5, 75, 0),
            child: new Text("记录你的生活", style: hint_textStyle,),
          )
        ],
      ),
    );
  }
}

class BigExtendCardModel1 extends StatefulWidget{
  State<StatefulWidget> createState(){
    return new BigExtendCardModel1State();
  }
}

class BigExtendCardModel1State extends State<BigExtendCardModel1>{

  Widget build(BuildContext context) {
    return new CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        new SliverPadding(
          padding: EdgeInsets.all(0),
          sliver: new SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  new Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 10, 10),
                    height: 440,
                    width: 280,
                    child:new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new TextFormField(
                          decoration: InputDecoration(
                            hintText: '输入标题',
                            hintStyle: big_titleStyle,
                          ),
                          onSaved: null,
                        ),
                        new TextFormField(
                          decoration: InputDecoration(
                            hintText: '记录你的生活',
                            hintStyle: big_textStyle,
                            border: InputBorder.none,
                          ),
                          maxLines: 15,
                          onSaved: null,
                        ),
                      ],
                    ),
                  )
                ],
              )
          ),
        )
      ],
    );
  }
}

class BigExtendCardModel2 extends StatefulWidget{
  State<StatefulWidget> createState(){
    return new BigExtendCardModel2State();
  }
}

class BigExtendCardModel2State extends State<BigExtendCardModel2>{
  var _imgPath;

  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return new Container(
        height: 180,
        width: 260,
        decoration: BoxDecoration(
          border: new Border.all(
            width: 0.7,
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
          color: Colors.white,
        ),
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
            new Icon(Icons.add_circle, color: Colors.grey, size: 100,),
            new Text("添加图片",style: big_textStyle,),
          ],
        ),
      );
    } else {
      return new SizedBox(
        height: 180,
        width: 260,
        child: Image.file(
          imgPath,
          fit: BoxFit.fill,
        ),
      );
    }
  }

  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }


  Widget build(BuildContext context){
    return new Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      height: 440,
      width: 280,
      child:new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            child: _ImageView(_imgPath),
            onTap: (){
              _openGallery();
            },
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0)),
          new Row(
            children: <Widget>[
              new Padding(padding: EdgeInsets.fromLTRB(7, 0, 0, 0)),
              new Icon(Icons.account_balance,size: 15,color: Colors.grey,),
              new Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0)),
              new Expanded(
                child: new TextFormField(
                  decoration: InputDecoration(
                    hintText: '输入店名',
                    hintStyle: big_hint_textStyle,
                  ),
                  onSaved: null,
                ),
              ),
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0)),
          new Row(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Text("菜式:",style: big_textStyle,),
                  new Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 22))
                ],
              ),
              new Padding(padding: EdgeInsets.fromLTRB(6, 0, 0, 0)),
              new Expanded(
                child: new TextFormField(
                  decoration: InputDecoration(
                    hintText: '记录美食',
                    hintStyle: big_hint_textStyle,
                    border: InputBorder.none,
                  ),
                  maxLength: 6,
                  onSaved: null,
                ),
              )
            ],
          ),
          new Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
          new Row(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Text("点评:",style: big_textStyle,),
                  new Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 22))
                ],
              ),
              new Padding(padding: EdgeInsets.fromLTRB(3, 0, 0, 0)),
              new Expanded(
                child: new TextFormField(
                  decoration: InputDecoration(
                    hintText: '记录你的评价',
                    hintStyle: big_hint_textStyle,
                    border: InputBorder.none,
                  ),
                  maxLength: 6,
                  onSaved: null,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
