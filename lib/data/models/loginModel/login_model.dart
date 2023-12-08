class LoginModel {
  bool status;
  String message;
  String token;
  User user;

  LoginModel({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginModel.fromJson(Map json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  int id;
  String name;
  String email;
  String username;
  String profileImageOriginalName;
  String profileImageName;
  String profileImageUrl;
  String verify;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.profileImageOriginalName,
    required this.profileImageName,
    required this.profileImageUrl,
    required this.verify,
  });

  factory User.fromJson(Map json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      profileImageOriginalName: json['profile_image_original_name'],
      profileImageName: json['profile_image_name'],
      profileImageUrl: json['profile_image_url'],
      verify: json['verify'],
    );
  }
}