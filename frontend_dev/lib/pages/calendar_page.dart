import 'package:flutter/material.dart';
// import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:intl/intl.dart' show DateFormat;

class CalenderPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Center(
      child: new SizedBox(
        width: 340,
        height: 525,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
          child: new Column(
            children: <Widget>[
              new SizedBox(height: 10.0,),
              new Container(
                  child:new TimeLinePage()
              ),
              //流式布局Wrap
              new Wrap(
                spacing: 5.0,
                runSpacing: 0.0,
                children: <Widget>[
                  Chip(
                    label: Text("abcd"),
                    avatar: CircleAvatar(
                      backgroundColor: Color(0xfff1f1f1),
                      child: Text("A",style: TextStyle(fontSize: 12.0),),
                    ),
                  ),
                  Chip(
                    label: Text("abcd"),
                    avatar: CircleAvatar(
                      backgroundColor: Color(0xfff1f1f1),
                      child: Icon(Icons.alarm),
                    ),
                  ),
                  Chip(
                    label: Text("abcd"),
                    avatar: Icon(Icons.alarm),
                  ),
                  Chip(
                    label: Text("abcd"),
                    avatar: CircleAvatar(
                      backgroundColor: Color(0xfff1f1f1),
                      child: Text("C",style: TextStyle(fontSize: 12.0),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}
class _TimeLinePageState extends State<TimeLinePage> {

  DateTime _currentDate = DateTime.now();
  EventList<Event> _markedDate = new EventList<Event>(
      events: {
        new DateTime(2019, 5, 3): [
          new Event(
            date: new DateTime(2019, 5, 3),
          ),
          new Event(
            date: new DateTime(2019, 5, 3),
          ),
        ],
      }
  );

  @override
  void initState(){
    //  _markedDate.add(new DateTime(2019,5,3), new Event(
    //    date: new DateTime(2019, 5, 3),
    //));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child:CalendarCarousel<Event>(
          onDayPressed:(DateTime date,List<Event> events){this.setState(()=>handle(date));},
          todayButtonColor: Colors.blue,
          todayBorderColor: Colors.white,
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          thisMonthDayBorderColor: Colors.white,
          headerMargin: EdgeInsets.all(0.0),

          maxSelectedDate: _currentDate,
          // markedDatesMap: _markedDate,
          width: 300.0,
          height: 400.0,
          markedDateIconBuilder: (event) {
            return Icon(Icons.lens);
          },
          daysHaveCircularBorder: true,
          /*Calendar(
            onDateSelected: (day)=>handle(day),
            isExpandable: true,*/
        )
    );
  }
  void handle(date){if(_currentDate.isAfter(date)){Navigator.push(context, MaterialPageRoute(builder: (context)=>new Day()));}}
}

class Day extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: new AppBar(
          title: new Text("。。。"),
        ),
        body:new Center(child:new Text('。。。'))
    );
  }
}