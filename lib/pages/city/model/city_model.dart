class CityModel {
  CityModel({
    required this.abbreviation,
    required this.name,
  });

  String abbreviation;
  String name;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        abbreviation: json["sigla"],
        name: json["nome"],
      );

  static List<CityModel> listFromJson(list) =>
      List<CityModel>.from(list.map((x) => CityModel.fromJson(x)));
}
