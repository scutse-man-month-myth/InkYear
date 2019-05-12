import 'package:frontend_dev/widgets/Card.dart';
import 'package:flutter/material.dart';
import 'package:frontend_dev/widgets/CardModel.dart';
import 'package:frontend_dev/constants/SourceImages.dart';
import 'package:frontend_dev/database/table_card.dart';
import 'package:frontend_dev/widgets/Toast.dart';

String _modelTag1 = "1";
String _modelTag2 = "2";
String _modelTag3 = "3";
String _modelTag4 = "4";

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
          image: AssetImage(SourceImages.background),
          fit: BoxFit.fitWidth,
        )
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          /*leading: new IconButton(
              icon: new Icon(Icons.keyboard_backspace, size: 40, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
              }
          ),*/
          leading: BackButton(),
          title: new Text("卡片模板", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
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
                                child: new SelectCard(
                                  child: ExtendCardModel1(),
                                  onPressed: () async {
                                    // await addExtendCard1();
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(
                                  child: ExtendCardModel3(),
                                  onPressed: (){
                                    // TODO: await addExtendCard3();
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              /*new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),*/
                            ],
                          ),
                          new Column(
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                                child: new SelectCard(
                                  child: ExtendCardModel2(),
                                  onPressed: () async{
                                    // await addExtendCard2();
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              /*new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new ExtendCardModel4(),
                              ),*/
                              new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(
                                  onPressed: () {
                                    Toast.toast(context, '一大波卡片模板正在来袭...');
                                  },
                                ),
                              ),
                              /*new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new SelectCard(),
                              ),*/
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