// TODO: 颜色样式修改（硬编码=>全配置）
// TODO: 小人换掉
// TODO: 状态和数据库联动
// TODO: 卡片和日历联动
// TODO: 卡片和数据库联动
// TODO: 软件文件
// TODO: 打包资源
// TODO: 演示视频
// TODO: 总结项目
// TODO: 一些映射配置化
// TODO: 增多减少

// 父控件管理还是initState管理
// 父控件参数还是子控件参数
// 如何优雅地传参
// isBool ? :和isBool = []
// 各种Widget
// 设置默认参数而不是硬编码，多传参多写构造而不是硬编码
//

/*List<Widget> buttons = List.generate(3, (int tabIndex) =>
    IconButton(
      icon: Icon(
        icons[tabIndex],
        size: _tabIndex == tabIndex ? 35 : 30,
        color: _tabIndex == tabIndex ? Colors.blue : Colors.white,
      ),
      onPressed: () async {
        int totalState = await queryTotalState();
        await _buildDailyRecord(totalState);
        _bodys[2] = DailyRecord(
          currentState: widget.currentState,
          currentMental: widget.currentMental,
          currentPhysical: widget.currentPhysical,
          currentSkill: widget.currentSkill,
          currentSense: widget.currentSense,
          currentOthers: widget.currentOthers,
          img: widget.stateImg,
          mood: widget.stateIcon,
          dState: totalState - 1250,
        );
        setState(() {
          _tabIndex = tabIndex;
          if(_tabIndex == 1) _isEdit = true;
          else _isEdit = false;
        });
      },
    )
);*/

/*Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: _buildBottomNavigatorButtons(),
  /*<Widget>[
    new IconButton(
      icon: new Icon(
        Icons.calendar_today,
        size: _tabIndex == 0 ? 35 : 30,
        color: _tabIndex == 0 ? Colors.blue : Colors.white,
      ),
      onPressed: () {
        setState(() {
          _tabIndex = 0;
          _isEdit = false;
        });
      },
    ),
    new IconButton(
      icon: new Icon(
        Icons.add_circle_outline,
        size: _tabIndex == 1 ? 35 : 30,
        color: _tabIndex == 1 ? Colors.blueAccent : Colors.white,
      ),
      onPressed: () {
        setState(() {
          _tabIndex = 1;
          _isEdit = true;
        });
      },
    ),
    new IconButton(
      icon: new Icon(
        Icons.child_care,
        size: _tabIndex == 2 ? 35 : 30,
        color: _tabIndex == 2 ? Colors.blueAccent : Colors.white,
      ),
      onPressed: () {
        setState(() {
          _tabIndex = 2;
          _isEdit = false;
        });
      },
    ),
  ],*/
),*/