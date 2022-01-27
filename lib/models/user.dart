class User {
  int id;
  String name;
  String username;
  String email;

  User({
    required this.id, 
    required this.name, 
    required this.username, 
    required this.email
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email
    };
  }
}