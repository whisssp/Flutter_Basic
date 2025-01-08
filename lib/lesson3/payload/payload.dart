
class User {
  final int? id;
  final String? name;
  final String? password;

  User({
    this.id,
    this.name,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'data': {
          'id': int id,
          'name': String name,
          'password': String password,
        }
      } =>
          User(
            id: id,
            name: name,
            password: password,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

