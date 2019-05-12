import 'package:flutter/material.dart';
// TODO: 测试条目
import 'package:frontend_dev/pages/swiper_page.dart';
// TODO: 测试条目
import 'package:frontend_dev/pages/enter_page.dart';
import 'package:frontend_dev/widgets/Toast.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';

class Calender extends StatefulWidget {
  Calender({this.marks});

  Map<DateTime, bool> marks = {DateTime.now(): true};

  @override
  _CalenderState createState() => new _CalenderState();
}
class _CalenderState extends State<Calender> {
  DateTime _currentDate = DateTime.now();
  EventList<Event> _markedDates= new EventList();
  // TODO: 时间相关参数随点选改变而不是网络获取
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    // TODO: 测试条目
    print('widget.marks: ');
    print(widget.marks);
    if(widget.marks != null) {
      widget.marks.forEach((DateTime date, bool isMark) {
        _markedDates.add(date, Event(date: date));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: CalendarCarousel<Event> (
          todayButtonColor: Colors.blue[300],
          todayBorderColor: Colors.white,
          thisMonthDayBorderColor: Colors.white,
          markedDateIconBorderColor: Colors.blue[300],
          nextMonthDayBorderColor: Colors.blue[300],
          prevMonthDayBorderColor: Colors.blue[300],
          todayTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
          headerMargin: EdgeInsets.all(0.0),
          maxSelectedDate: _currentDate,
          width: 300.0,
          height: 300.0,
          // TODO: 不用EventList改用右上角标（待查）
          // markedDatesMap: _markedDates,
          // markedDateIconBuilder: (event) {
             // ...
          // },
          onDayPressed: (DateTime date, List<Event> events) {
            setState(() {
              // TODO: 测试条目
              print('widget.marks.isNotEmpty: ${widget.marks != null}');
              print(widget.marks);
              handle(date);
            });
          },
        )
    );
  }

  void handle(date) {
    if(_currentDate.isAfter(date)) {
      // TODO: 停在本页面，数据库交互
      // TODO: 测试条目
      Navigator.push(context, MaterialPageRoute(builder: (context)=>EnterPage()));
    }
  }
}