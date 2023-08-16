class GroupModel {
  GroupModel({
    required this.name,
    required this.age,
  });

  String name;
  int age;

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        name: json["name"],
        age: json["age"],
      );

  static List<GroupModel> listFromJson(list) => List<GroupModel>.from(list.map((x) => GroupModel.fromJson(x)));
}
