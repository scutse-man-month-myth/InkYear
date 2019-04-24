import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:frontend_dev/datas/Province.dart';
import 'package:frontend_dev/datas/City.dart';
import 'package:frontend_dev/datas/County.dart';

// 选择地点的参数
int currentLevel = 0;
int levelProvince = 0;
int levelCity = 1;
int levelCounty = 2;
int selectProvince;
int selectCity;
int selectCounty;
String province;
String city;
String county = "";
String weatherId;
List provinceList = <String>[];
List cityList = <String>[];
List countyList = <String>[];


/*得到省份参数*/
// TODO:改成非私有的了
getProvinces(BuildContext context) async{
  var url = 'http://guolin.tech/api/china/';
  var httpClient = new HttpClient();

  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var json = await response.transform(utf8.decoder).join();
  var data = jsonDecode(json);
  provinceList = data.map((m) => new Province.fromJson(m)).toList();
  await Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new ChooseProvince()),
  );
}

/*得到城市参数*/
_getCities(BuildContext context) async{
  var url = 'http://guolin.tech/api/china/' + selectProvince.toString();
  var httpClient = new HttpClient();

  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var json = await response.transform(utf8.decoder).join();
  var data = jsonDecode(json);
  cityList = data.map((m) => new City.fromJson(m)).toList();
  await Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new ChooseCity()),);
}

/*得到国家参数*/
_getCounties(BuildContext context) async{
  var url = 'http://guolin.tech/api/china/' + selectProvince.toString() + "/" + selectCity.toString();
  var httpClient = new HttpClient();

  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var json = await response.transform(utf8.decoder).join();
  var data = jsonDecode(json);
  countyList = data.map((m) => new County.fromJson(m)).toList();
  await Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new ChooseCounty()),);
}

/*选择省页面*/
class ChooseProvince extends StatefulWidget{
  State<StatefulWidget> createState(){
    return new ChooseProvinceState();
  }
}
class ChooseProvinceState extends State<ChooseProvince>{
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
            leading: new IconButton(
                icon: new Icon(Icons.keyboard_backspace),
                onPressed: (){
                  Navigator.pop(context);
                }),
            title:  new Text("中国")
        ),
        body: new ListView.builder(
            itemCount: provinceList.length,
            itemBuilder: buildItem
        )
    );
  }

  Widget buildItem(BuildContext context, int index) {
    TextStyle textStyle = new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0);

    return new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Container(
          width: double.infinity,
          height: 38,
          child: new FlatButton(
              onPressed: (){
                setState(() {
                  selectProvince = provinceList[index].id;
                  _getCities(context);
                  province = provinceList[index].pname;
                });
              },
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Divider(),
                  new Text(provinceList[index].pname, style: textStyle,)
                ],
              )
          ),
        )
    );
  }
}

/*选择市页面*/
class ChooseCity extends StatefulWidget{
  State<StatefulWidget> createState(){
    return new ChooseCityState();
  }
}
class ChooseCityState extends State<ChooseCity>{
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
            leading: new IconButton(
                icon: new Icon(Icons.keyboard_backspace),
                onPressed: (){
                  Navigator.pop(context);
                }),
            title:  new Text(province)
        ),
        body: new ListView.builder(
            itemCount: cityList.length,
            itemBuilder: buildItem
        )
    );
  }

  Widget buildItem(BuildContext context, int index) {
    TextStyle textStyle = new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0);

    return new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Container(
          width: double.infinity,
          height: 38,
          child: new FlatButton(
              onPressed: (){
                setState(() {
                  selectCity = cityList[index].id;
                  _getCounties(context);
                  city = cityList[index].cityName;
                });
              },
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Divider(),
                  new Text(cityList[index].cityName, style: textStyle,)
                ],
              )
          ),
        )
    );
  }
}

/*选择乡镇页面*/
class ChooseCounty extends StatefulWidget{
  State<StatefulWidget> createState(){
    return new ChooseCountyState();
  }
}
class ChooseCountyState extends State<ChooseCounty>{
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
            leading: new IconButton(
                icon: new Icon(Icons.keyboard_backspace),
                onPressed: (){
                  Navigator.pop(context);
                }),
            title:  new Text(city)
        ),
        body: new ListView.builder(
            itemCount: countyList.length,
            itemBuilder: buildItem
        )
    );
  }

  Widget buildItem(BuildContext context, int index) {
    TextStyle textStyle = new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0);

    return new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Container(
          width: double.infinity,
          height: 38,
          child: new FlatButton(
              onPressed: (){
                setState(() {
                  selectCounty = countyList[index].id;
                  county = countyList[index].countyName;
                  weatherId = countyList[index].weatherId;
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              },
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Divider(),
                  new Text(countyList[index].countyName, style: textStyle,)
                ],
              )
          ),
        )
    );
  }
}
