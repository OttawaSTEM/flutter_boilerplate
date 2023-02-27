class UserModel {
  String? name;
  int? age;

  UserModel({
    this.name,
    this.age,
  });

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

  static List<UserModel> listFromJson(list) =>
      List<UserModel>.from(list.map((x) => UserModel.fromJson(x)));
}
