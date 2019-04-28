import 'package:flutter/material.dart';
import 'package:frontend_dev/tools/Card.dart';
import 'package:frontend_dev/tools/Tag.dart';
import 'package:frontend_dev/tools/CardModel.dart';

//编辑卡片页面
class CardPage extends StatefulWidget{
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>{
  Widget build(BuildContext context){
    return new Stack(
      children: <Widget>[
        new Positioned(
            top: 10,
            left: (MediaQuery.of(context).size.width - 320) / 2.0 + 80,
            child: MainTag(
              size: 110,
              color: Colors.grey,
            )
        ),
        new Positioned(
            top: 10,
            left: (MediaQuery.of(context).size.width - 320) / 2.0 + 40,
            child: MainTag(
              size: 110,
              color: Colors.blue,
            )
        ),
        new Positioned(
          top: 10,
          left: (MediaQuery.of(context).size.width - 320) / 2.0,
          child: new MainCard(
            cardSize: 110,
            color: Colors.white,
            child: new Center(
                child: new BasicCardModel(),
            ),
          ),
        ),
        new Positioned(
            top: 50,
            right: (MediaQuery.of(context).size.width - 320) / 2.0 + 20,
            child: new IconButton(
                icon: new Icon(Icons.add_circle, size: 40,),
                onPressed: null
            )
        )
      ],
    );
  }
}