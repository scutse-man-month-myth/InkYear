class Province{
  int id;
  String provinceName;

  Province({this.id, this.provinceName});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id:  json['id'],
      provinceName: json['name']
    );
  }
}