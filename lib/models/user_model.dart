class User {
  late int id;
  String? username;
  String? email;
  String? account_type;
  String? api_token;
  String? login_type;

  User({
    required this.id,
    this.username,
    this.email,
    this.account_type,
    this.api_token,
    this.login_type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['name'],
      email: json['email'],
      account_type: json['account_type'],
      api_token: json['api_token'],
      login_type: json['login_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': username,
      'email': email,
      'api_token': api_token,
    };
  }
}
