class Province{
  int id;
  String pname;

  Province({this.id, this.pname});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id:  json['id'],
      pname: json['name']
    );
  }
}