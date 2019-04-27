import 'package:frontend_dev/tools/Card.dart';
import 'package:flutter/material.dart';

class CardPacketPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _CardPacketPageState();
  }
}

class _CardPacketPageState extends State<CardPacketPage>{
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        image: DecorationImage(
          image: AssetImage("imgs/background2.jpg"),
          fit: BoxFit.fitWidth,
        )
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: new IconButton(
              icon: new Icon(Icons.keyboard_backspace, size: 40, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
              }
          ),
          title: new Text("卡片模板", style: TextStyle(fontSize: 25),),
        ),
        body: new CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            new SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              sliver: new SliverList(
                delegate: SliverChildListDelegate(
                    <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: new SelectCard(),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),
                            ],
                          ),
                          new Column(
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                                child: new SelectCard(),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),
                            ],
                          )
                        ],
                      )
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}