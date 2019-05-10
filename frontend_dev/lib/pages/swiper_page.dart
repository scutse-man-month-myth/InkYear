import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:frontend_dev/tools/Card.dart';
import 'package:frontend_dev/tools/CardModel.dart';
import 'package:frontend_dev/pages/card_page.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width,
      //height: 200.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 3,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: _goOtherApp,
        ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(60, 120, 0, 0),
      child: MainCard(),
      // child: new CardPrototype(child: new ExtendCardModel1()),
      // child: new CardPrototype(child: new BasicCardModel()),
    );

    //new Center(
    //        child: MainCard(),
    //    );

    //(Image.network("http://via.placeholder.com/350x150", fit: BoxFit.fill,)
    //);
  }

  void _goOtherApp(int index) async {
    const url = 'flutter://li.zhuoyuan'; //这个url就是由scheme和host组成的 ：scheme://host
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}