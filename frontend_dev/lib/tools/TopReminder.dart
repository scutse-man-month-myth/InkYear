import 'package:flutter/material.dart';

class TopReminder extends StatefulWidget {
  /// 提醒文本。
  final String reminderText;

  TopReminder({
    @required
    this.reminderText,
    this.child
  });

  Widget child;

  @override
  _TopReminderState createState() => _TopReminderState();
}

// 与自定义的顶部提醒组件关联的状态子类。
class _TopReminderState extends State<TopReminder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: new Column(
          children: <Widget>[
            new Container(
              // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
                width: double.infinity,
                height: 350.0,
                color: Colors.transparent,
                child: widget.child,
            )
          ],
        )
    );
  }
}