import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:frontend_dev/widgets/Card.dart';
import 'package:frontend_dev/widgets/CardModel.dart';
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
      ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(60, 120, 0, 0),
      // TODO: 解决和CardPrototype的冲突
      child: MainCard(),
    );
  }
}
