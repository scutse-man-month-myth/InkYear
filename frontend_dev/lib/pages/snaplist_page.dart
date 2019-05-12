import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';
import 'dart:math';

class SnaplistPage extends StatelessWidget {
  final List<Widget> widgets;
  final VoidCallback loadMore;

  const SnaplistPage({Key key, this.widgets, this.loadMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size cardSize = Size(400.0, 550.0);

    final controller = SnaplistController(initialPosition: 2);

    final random = new Random();

    return Stack(
      children: <Widget>[
        SnapList(
          padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width - cardSize.width) / 2),
          sizeProvider: (index, data) => cardSize,
          separatorProvider: (index, data) => Size(10.0, 10.0),
          positionUpdate: (int index) {
            if (index == widgets.length - 1) {
              loadMore();
            }
          },
          builder: (context, index, data) {
            return ClipRRect(
              borderRadius: new BorderRadius.circular(16.0),
              child: widgets[index],
            );
          },
          count: widgets.length,
          snaplistController: controller,
        ),
        /*Positioned(
          child: FloatingActionButton(
            onPressed: () =>
                controller.setPosition(random.nextInt(widgets.length)),
          ),
          bottom: 10,
          right: 10,
        )*/
      ],
    );
  }
}
