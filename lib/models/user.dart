import 'dart:convert';

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
  });

  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, address: $address, type: $type, token: $token)';
  }
}
