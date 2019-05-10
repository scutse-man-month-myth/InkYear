import 'package:flutter/material.dart';
import 'package:frontend_dev/tools/Card.dart';
import 'package:frontend_dev/tools/Tag.dart';
import 'package:frontend_dev/tools/CardModel.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

int _itemCount ;

//编辑卡片页面
class CardPage extends StatefulWidget{
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>{
  Widget build(BuildContext context){
    return new Center(
      child: new SwiperView(),
    );
    /*new Stack(
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
    );*/
  }
}

class SwiperView extends StatefulWidget {
  @override
  _SwiperViewState createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {

  List<Widget> cardList = List();

  void initState(){
    // TODO: 修改界面
    cardList
    ..add(new CardPrototype(child: new BasicCardModel()))
      ..add(new CardPrototype(child: new BasicCardModel()))
      ..add(new CardPrototype(child: new ExtendCardModel1()));

    _itemCount = cardList.length;
    super.initState();
  }

  Widget build(BuildContext context){
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Swiper(
        itemCount: _itemCount,
        itemBuilder: _swiperBuilder,
        /*pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.fromLTRB(0, 0, 300, 30),
              builder: DotSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.blue
              )
        ),*/
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: false,
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (cardList[index]);
  }
}

class CardPrototype extends StatefulWidget{
  Widget child;
  CardPrototype({this.child});
  @override
  _CardPrototypeState createState() => _CardPrototypeState();
}

class _CardPrototypeState extends State<CardPrototype>{
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
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}

Widget contain(int index){
  return new Center(
    child: new Text("card $index"),
  );
}






