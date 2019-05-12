class City{
  int id;
  String cityName;

  City({this.id, this.cityName});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        id:  json['id'],
        cityName: json['name']
    );
  }
}