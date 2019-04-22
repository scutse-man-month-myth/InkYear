class County{
  int id;
  String countyName;
  String weatherId;

  County({this.id, this.countyName, this.weatherId});

  factory County.fromJson(Map<String, dynamic> json) {
    return County(
        id:  json['id'],
        countyName: json['name'],
        weatherId: json['weather_id']
    );
  }
}