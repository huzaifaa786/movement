class CompanyUser {
  late int id;
  String? username;
  String? email;
  String? account_type;
  String? api_token;
  String? login_type;
  String? name; // Add the 'name' property
  String? type;
  String? image;
  CompanyUser({
    required this.id,
    this.username,
    this.email,
    this.account_type,
    this.api_token,
    this.login_type,
    this.name,
    this.type,
    this.image,
  });

  // Factory method to create an instance from JSON data
  factory CompanyUser.fromJson(Map<String, dynamic> json) {
    return CompanyUser(
      id: json['id'],
      username: json['name'],
      email: json['email'],
      account_type: json['account_type'],
      api_token: json['api_token'],
      login_type: json['login_type'],
      name: json['name'], // Assign value to the 'name' property
      type: json['type'],
      image: json['image'],
    );
  }

  // Method to convert the model to JSON data
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'name': name,
      'type': type,
      'image':image,
    };
  }
}
