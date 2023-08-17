class UserModel {
  UserModel({
    this.name,
    this.age,
  });

  String? name;
  int? age;

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['age'] = age;

    return data;
  }

  static List<UserModel> listFromJson(list) => List<UserModel>.from(list.map((x) => UserModel.fromJson(x)));
}

class CityModel {
  CityModel({
    required this.abbreviation,
    required this.name,
  });

  String abbreviation;
  String name;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        abbreviation: json['sigla'],
        name: json['nome'],
      );

  static List<CityModel> listFromJson(list) => List<CityModel>.from(list.map((x) => CityModel.fromJson(x)));
}
