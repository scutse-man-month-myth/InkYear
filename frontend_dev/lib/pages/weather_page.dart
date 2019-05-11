import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'dart:io';
import 'package:frontend_dev/datas/Weather.dart';
import 'package:frontend_dev/datas/Location.dart';

class WeatherPage extends StatefulWidget{
  State<StatefulWidget> createState(){
    return new WeatherPageState();
  }
}
class WeatherPageState extends State<WeatherPage> {
  WeatherData weather = WeatherData.empty();
  Color weatherPageColor = Colors.white;

  WeatherPageState() {
    _getWeather();
  }

  void _getWeather() async {
    WeatherData data = await _fetchWeather();
    setState(() {
      weather = data;
    });
  }

  Future<WeatherData> _fetchWeather() async {
    var url = "https://free-api.heweather.com/s6/weather/now?location=" +
        weatherId + "&key=cc33b9a52d6e48de852477798980b76e";
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var json = await response.transform(utf8.decoder).join();
    var data = jsonDecode(json);
    return WeatherData.fromJson(data);
  }

  Widget build(BuildContext context) {
    return new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: new Scaffold(
          backgroundColor: Colors.black.withOpacity(0.3),
          appBar: AppBar(
            leading: BackButton(),
          ),
          body: new Container(
              width: double.infinity,
              height: 350.0,
              color: Colors.transparent,
              child: new Stack(
                children: <Widget>[
                  /*new Positioned(
                      top: 30,
                      left: 10,
                      child: new IconButton(
                          icon: new Icon(Icons.keyboard_backspace, size: 40,
                            color: weatherPageColor,),
                          onPressed: () {
                            Navigator.pop(context);
                          }
                      )
                  ),*/
                  new Positioned(
                      top: 35,
                      left: (MediaQuery
                          .of(context)
                          .size
                          .width - 110) / 2.0,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: new Icon(
                              Icons.location_on, color: weatherPageColor,
                              size: 30,),
                          ),
                          new Text(county, style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: weatherPageColor),),
                        ],
                      )
                  ),
                  new Positioned(
                    top: 140,
                    left: 30,
                    child: new Icon(
                      Icons.cloud_queue, size: 130, color: Colors.white,),
                  ),
                  new Positioned(
                      top: 100,
                      right: 20,
                      child: new Container(
                        height: 240,
                        width: 220,
                        color: Colors.transparent,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(weather.tmp,
                                        style: TextStyle(fontSize: 80,
                                            fontWeight: FontWeight.w500,
                                            color: weatherPageColor)),
                                    new Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                                      child: new Text(
                                          "C", style: TextStyle(fontSize: 50,
                                          fontWeight: FontWeight.w500,
                                          color: weatherPageColor)),
                                    )

                                  ],
                                )
                            ),
                            new Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: new Divider(
                                height: 1,
                                color: weatherPageColor,
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      new Text(
                                          "湿度", style: TextStyle(fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: weatherPageColor)),
                                      new Text(weather.hum,
                                          style: TextStyle(fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                              color: weatherPageColor)),
                                    ],
                                  ),
                                  new SizedBox(
                                    height: 60,
                                    width: 0.1,
                                    child: new Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white)
                                      ),
                                    ),
                                  ),
                                  new Text(weather.cond,
                                      style: TextStyle(fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: weatherPageColor)),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ],
              )
          ),
        )
    );
  }
}
