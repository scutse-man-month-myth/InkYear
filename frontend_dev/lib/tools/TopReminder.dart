import 'package:flutter/material.dart';

class TopReminder extends StatefulWidget {
  /// 提醒文本。
  final String reminderText;

  TopReminder({
    @required
    this.reminderText,
    this.widgetChild
  });

  Widget widgetChild;

  @override
  _TopReminderState createState() => _TopReminderState();
}

// 与自定义的顶部提醒组件关联的状态子类。
class _TopReminderState extends State<TopReminder> {
  // TODO: 第4步：实现“倒计时抛”。

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
                child: widget.widgetChild,
            )
          ],
        )
      // TODO: 第3步：实现“路由导航”，点击提醒页面时返回。
    );
  }
}