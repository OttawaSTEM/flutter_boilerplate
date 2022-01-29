import 'dart:convert';

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  const User({
    required this.id, 
    required this.name, 
    required this.username, 
    required this.email
  });

  // User.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   username = json['username'];
  //   email = json['email'];
  // }

  // static User? fromMap(Map<String, dynamic> map) {
  //   if (map == null) 
  //     return null;

  //   return User(
  //     id: map['id'],
  //     name: map['name'],
  //     username: map['username'],
  //     email: map['email'],
  //   );
  // }
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email
    };
  }

  // String toJson() => json.encode(toMap());



  // @override
  // String toString() {
  //   return 'CatPhoto(id: $id, name: $name, username: $username, email: $email)';
  // }


}