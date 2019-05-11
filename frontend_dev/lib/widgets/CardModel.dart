import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart';
import 'package:frontend_dev/constants/AntDesignIcons.dart';
import 'package:frontend_dev/database/table_card.dart';
import 'package:frontend_dev/database/table_state.dart';
import 'package:frontend_dev/widgets/Toast.dart';
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
  List<Widget> _checkboxTiles = [
    /*Row(
      children: <Widget>[
        Icon(Icons.all_inclusive, size: 20),
        SizedBox(width: 10),
        Text('示例标题', style: TextStyle(fontSize: 17)),
        SizedBox(width: 70),
        Checkbox(
            value: false,
            tristate: true,
            checkColor: Colors.white,
            activeColor: Colors.green,
            onChanged: (bool choice) {
              // ...
            }
        ),
      ],
    )*/
    SizedBox(),
  ];
  List<bool> _isChecks = [false];

  State<StatefulWidget> createState(){
    return BasicCardModelState();
  }
}

class BasicCardModelState extends State<BasicCardModel>{

  double value1 = 7;
  double value2 = 0.0;

  /*String title;
  String content;*/

  int _currStep = 0;
  int _currCheckBox = 1;

  List<bool> _isSwitchs = [false, false, false];
  List<bool> _isStars = [false, false, false, false, false];

  @override
  Widget build(BuildContext context){

    Widget _buildCheckboxTile(IconData iconData, String title, int index, int tag) {
      return Row(
        children: <Widget>[
          Icon(iconData, size: 20),
          SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 17)),
          SizedBox(width: 70),
          Checkbox(
            value: widget._isChecks[index],
            tristate: true,
            checkColor: Colors.white,
            activeColor: Colors.green,
            onChanged: (bool choice) async {
              int value = await querySingleState(tag);
              await queryState();

              setState(() {
                if(choice == true) {
                  widget._isChecks[index] = true;
                  widget._checkboxTiles[index] = _buildCheckboxTile(iconData, title, index, tag);
                  updateSingleState(tag, value+5);
                }
                else {
                  widget._isChecks[index] = false;
                  widget._checkboxTiles[index] = _buildCheckboxTile(iconData, title, index, tag);
                  updateSingleState(tag, value-5);
                }
              });
            },
          ),
        ],
      );
    }

    Widget _buildSeekbarTile(String content) {
      return new Row(
        children: <Widget>[
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

    Widget _buildStar(int idx) {
      return GestureDetector(
        child: _isStars[idx]
            ? Icon(Icons.star, size: 35, color: Colors.black45)
            : Icon(Icons.star_border, size: 35, color: Colors.black45),
        onTap: () async {
          setState(() {
            _isStars[idx] = !_isStars[idx];
            for(int i=0; i<idx; i++) {
              _isStars[i] = _isStars[idx];
            }
          });
          int value = await querySingleState(States.others.index);
          await updateSingleState(States.others.index, value+5*(idx+1));
        },
      );
    }

    Widget _buildInputDialog() {
      String tag;
      String title;
      int state;
      Map<String, IconData> icons = {
        // TODO: 英文输入法
        "佛系": Icons.favorite,
        "mental": Icons.favorite,
        "养生": Icons.accessibility_new,
        "physical": Icons.accessibility_new,
        "技能": Icons.build,
        "skill": Icons.build,
        "素养": Icons.brush,
        "sense": Icons.brush,
        "其它": Icons.all_inclusive,
        "others": Icons.all_inclusive,
      };
      Map<String, int> tags = {
        // TODO: 英文输入法
        "佛系": 0,
        "mental": 0,
        "养生": 1,
        "physical": 1,
        "技能": 2,
        "skill": 2,
        "素养": 3,
        "sense": 3,
        "其它": 4,
        "others": 4,
      };

      return SimpleDialog(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
            child:   Text('新增打卡', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: TextField(
              decoration: InputDecoration(
                labelText: '请输入标签',
                hintText: 'E.g. 技能',
              ),
              onChanged: (String value) => tag = value,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: TextField(
              decoration: InputDecoration(
                labelText: '请输入标题',
                hintText: '逛逛论坛',
              ),
              onChanged: (String value) => title = value,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                child: Text('OK'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    print(tag);
                    print(title);
                    widget._isChecks.add(false);
                    widget._checkboxTiles.add(_buildCheckboxTile(icons[tag], title, _currCheckBox, tags[tag]));
                    // widget._checkboxTiles.add(_buildCheckboxTile(icons['佛系'], '佛系测试', _currCheckBox, 0));
                    _currCheckBox += 1;
                    print(widget._checkboxTiles.asMap());
                    Navigator.of(context).pop();
                  });
                },
              ),
              FlatButton(
                child: Text('CANCEL'),
                color: Colors.white,
                textColor: Colors.black54,
                disabledColor: Colors.blue,
                disabledTextColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ],
      );
    }

    Widget _buildFirstStepContent() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: widget._checkboxTiles,
      );
    }

    Widget _buildSecondStepContent() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // _buildSeekbarTile("睡眠时间"),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(
                  value: _isSwitchs[0],
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.red[200],
                  onChanged: (bool choice) async {
                    this.setState(() {
                      _isSwitchs[0] = !_isSwitchs[0];
                    });

                    int value;

                    value = await querySingleState(States.mental.index);

                    if(_isSwitchs[0] == true)
                      updateSingleState(States.physical.index, value+5);
                    else
                      updateSingleState(States.physical.index, value-5);

                    queryState();
                  },
                ),
                SizedBox(width: 10),
                Text('早起'),
                SizedBox(width: 25),
                Switch(
                  value: _isSwitchs[1],
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.red[200],
                  onChanged: (bool choice) async {
                    this.setState(() {
                      _isSwitchs[1] = !_isSwitchs[1];
                    });

                    int value;

                    value = await querySingleState(States.physical.index);

                    if(_isSwitchs[1] == true) {
                      updateSingleState(States.physical.index, value + 5);
                    }
                    else
                      updateSingleState(States.mental.index, value-5);

                    queryState();
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

    List<bool> _isChosens = [false, false, false, false, false];

    Widget _buildThirdStepContent() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Today's Goods: "),
          TextField(
            decoration: InputDecoration(
              hintText: '一句话记录下开心的事8\nE.g. 胡吃海喝',
            ),
            maxLines: 2,
            onChanged: (String text) async{
              int value = await querySingleState(States.mental.index);
              await updateSingleState(States.mental.index, value+(text.length ~/ 10));
            },
          ),
          SizedBox(height: 10),
          Text("Today's Bads: "),
          TextField(
            decoration: InputDecoration(
              hintText: '一句话记录下难过的事8\nE.g. 熬夜秃头',
            ),
            maxLines: 2,
            onChanged: (String text) async{
              int value = await querySingleState(States.mental.index);
              await updateSingleState(States.mental.index, value-(text.length ~/ 10));
            },
          ),
          SizedBox(height: 10),
          Text("Today's Mood: "),
          SizedBox(height: 10),
          // TODO: 改成动态
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                child: _isChosens[0]
                  ? Icon(AntDesignIcons.sad_tear, size: 35, color: Colors.red)
                  : Icon(AntDesignIcons.sad_tear, size: 35, color: Colors.black45),
                onTap: () async {
                  setState(() {
                    _isChosens[0] = !_isChosens[0];
                    Toast.toast(context, "You feel very bad today!");
                  });
                  int value = await querySingleState(States.mental.index);
                  await updateSingleState(States.mental.index, value-10);
                },
              ),
              GestureDetector(
                child: _isChosens[1]
                  ? Icon(AntDesignIcons.meh_rolling_eyes, size: 35, color: Colors.redAccent)
                  : Icon(AntDesignIcons.meh_rolling_eyes, size: 35, color: Colors.black45),
                onTap: () async {
                  setState(() {
                    _isChosens[1] = !_isChosens[1];
                    Toast.toast(context, "You feel bad today!");
                  });
                  int value = await querySingleState(States.mental.index);
                  await updateSingleState(States.mental.index, value-5);
                },
              ),
              GestureDetector(
                child: _isChosens[2]
                  ? Icon(AntDesignIcons.meh, size: 35, color: Colors.blue)
                  : Icon(AntDesignIcons.meh, size: 35, color: Colors.black45),
                onTap: () async {
                  setState(() {
                    _isChosens[2] = !_isChosens[2];
                    Toast.toast(context, "You feel just so so today!");
                  });
                  int value = await querySingleState(States.mental.index);
                  // await updateSingleState(States.mental.index, value);
                },
              ),
              GestureDetector(
                child: _isChosens[3]
                  ? Icon(AntDesignIcons.smile, size: 35, color: Colors.green)
                  : Icon(AntDesignIcons.smile, size: 35, color: Colors.black45),
                onTap: () async {
                  setState(() {
                    _isChosens[3] = !_isChosens[3];
                    Toast.toast(context, "You feel happy today!");
                  });
                  int value = await querySingleState(States.mental.index);
                  await updateSingleState(States.mental.index, value+5);
                },
              ),
              GestureDetector(
                child: _isChosens[4]
                  ? Icon(AntDesignIcons.squint, size: 35, color: Colors.greenAccent)
                  : Icon(AntDesignIcons.squint, size: 35, color: Colors.black45),
                onTap: () async {
                  setState(() {
                    _isChosens[4] = !_isChosens[4];
                    Toast.toast(context, "You feel very happy today!");
                  });
                  int value = await querySingleState(States.mental.index);
                  await updateSingleState(States.mental.index, value+10);
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Text("Today's Grade: "),
          SizedBox(height: 10),
          // TODO: 改成动态
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildStar(0),
              // SizedBox(width: 13),
              _buildStar(1),
              // SizedBox(width: 13),
              _buildStar(2),
              // SizedBox(width: 13),
              _buildStar(3),
              // SizedBox(width: 13),
              _buildStar(4),
            ],
          ),
        ],
      );
    }

    List<Widget> stepWidgets = [
      _buildFirstStepContent(),
      _buildSecondStepContent(),
      _buildThirdStepContent(),
    ];

    List<Step> _steps = [
      Step(
        title: new Text('随缘打卡'),
        content: (_currStep == 0) ? stepWidgets[0] : SizedBox(height: 1),
        state: StepState.complete,
        isActive: true,
        subtitle: (_currStep == 0) ? new Row(
          children: <Widget>[
            new Text('√ 吾日三省吾身也'),
            new SizedBox(width: 73.0),
            new IconButton(
              icon: new Icon(Icons.add_circle, color: Colors.green, size: 25.0),
              onPressed: () {
                print(widget._checkboxTiles.asMap());
                Navigator.of(context).push(
                  PageRouteBuilder(
                    // 当前的路由不会遮盖之前的路由
                    opaque: false,
                    // 构建路由的主要内容
                    pageBuilder: (BuildContext context, _, __) => _buildInputDialog(),
                  ),
                );
              },
            ),
          ],
        ) : new Text('√ 吾日三省吾身也'),
      ),
      Step(
        title: new Text('朋克养生'),
        content: (_currStep == 1) ? stepWidgets[1] : SizedBox(height: 1),
        state: StepState.complete,
        isActive: true,
        subtitle: (_currStep == 1) ? new Row(
          children: <Widget>[
            new Text('√ 生活不止有枸杞'),
            new SizedBox(width: 85.0),
            // TODO: 实现自定义添加
            new Icon(Icons.add_circle, color: Colors.green, size: 25.0),
          ],
        ) : new Text('√ 生活不止有枸杞'),
      ),
      Step(
        title: new Text('佛系度日'),
        content: (_currStep == 2) ? stepWidgets[2] : SizedBox(height: 1),
        state: StepState.complete,
        isActive: true,
        subtitle: (_currStep == 2) ? new Row(
          children: <Widget>[
            new Text('√ 乱喝鸡汤三脂高'),
            new SizedBox(width: 85.0),
            // TODO: 实现自定义添加
            new Icon(Icons.add_circle, color: Colors.green, size: 25.0),
          ],
        ) : new Text('√ 乱喝鸡汤三脂高'),
      ),
    ];

    return Align(
        alignment: Alignment.topCenter,
        child: new Stepper(
            currentStep: this._currStep,
            type: StepperType.vertical,
            steps: _steps,
          onStepTapped: (step) {
            print(widget._checkboxTiles.asMap());
            setState(() {
              _currStep = step;
            });
          },
          onStepCancel: () {
            print(widget._checkboxTiles.asMap());
            setState(() {
              if (_currStep > 0) {
                _currStep = _currStep - 1;
              } else {
                _currStep = 0;
              }
            });
          },
          onStepContinue: () {
            setState(() {
              print(widget._checkboxTiles.asMap());
              if (_currStep < _steps.length - 1) {
                _currStep = _currStep + 1;
              } else {
                _currStep = 0;
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
              // new Icon(Icons.edit, color: Colors.grey, size:15),
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
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // new Icon(Icons.tab, color: Colors.grey, size:15),
              new Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
              new Text("输入标签", style: titleStyle,),
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
                            hintText: '输入标签',
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
                  maxLength: 5,
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
                  maxLength: 5,
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
