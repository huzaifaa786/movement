class User {
  late String username;
  late String email;
  late String password;
 

  User({
    required this.username,
    required this.email,
    required this.password,
   
  });

  // Factory method to create an instance from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    
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
