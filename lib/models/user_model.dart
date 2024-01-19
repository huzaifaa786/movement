class User {
  late int id;
  String? username;
  String? email;
  String? password;
  String? account_type;
  String? api_token;
  String? login_type;

  User({
    required this.id,
    this.username,
    this.email,
    this.password,
    this.account_type,
    this.api_token,
    this.login_type,
  });

  // Factory method to create an instance from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['name'],
      email: json['email'],
      password: json['password'],
      account_type: json['account_type'],
      api_token: json['api_token'],
      login_type: json['login_type'],
    );
  }

  // Method to convert the model to JSON data
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
