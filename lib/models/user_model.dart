class User {
  late String name;
  late String email;
  String? api_token;

  User({
    required this.name,
    required this.email,
    this.api_token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      api_token: json['api_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'api_token': api_token,
    };
  }
}
