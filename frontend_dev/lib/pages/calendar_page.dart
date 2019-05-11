import 'package:flutter/material.dart';
import 'package:frontend_dev/constants/StateMap.dart';
import 'package:frontend_dev/widgets/Calender.dart';

class CalenderPage extends StatefulWidget {
  CalenderPage({this.tags, this.titles});

  // TODO: 两个列表变成一个字典
  List<int> tags;
  List<String> titles;
  List<Widget> chips = [
    Chip(
      label: Text("All >>"),
      avatar: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.dashboard, color: Colors.black),
        // TODO: 加onTap回调到对应卡片编辑页面
      ),
    ),
    Chip(
      label: Text("Daily"),
      avatar: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.alarm_on, color: Colors.black),
        // TODO: 加onTap回调到对应卡片编辑页面
      ),
    ),
  ];

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  void initState() {
    super.initState();
    // TODO: 测试条目
    print('widget.tags.isNotEmpty: ${widget.tags != null}');
    print(widget.tags);
    print('widget.titles.isNotEmpty: ${widget.titles != null}');
    print(widget.titles);
    // 若tags或titles为空则只生成Daily和All两个Chip
    // 若tags或titles不为空则生成新的chip并加进chips中
    if((widget.tags != null) || (widget.titles != null)) {
      widget.chips.addAll(List.generate(
        widget.titles.length, (int index){
          return Chip(
            label: Text(widget.titles[index]),
            avatar: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(stateIcons['${widget.tags[index]}'], color: Colors.black),
              // TODO: 加onTap回调到对应卡片编辑页面
            ),
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        color: Colors.white,
        width: 340,
        height: 525,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 日历控件
              new SizedBox(height: 10.0),
              new Container(
                  child:new Calender(marks: {DateTime.now(): true},)
              ),
              // 日期控件
              new Text(
                ' # ${(DateTime.now().toString().split('\ '))[0]}',
              ),
              new SizedBox(height: 10.0),
              // 标签控件
              new Wrap(
                spacing: 10.0,
                runSpacing: 0.0,
                children: widget.chips,
              )
            ],
          ),
        ),
      )
    );
  }
}
