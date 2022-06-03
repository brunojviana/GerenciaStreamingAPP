class User {
  const User({this.usermail, this.password, this.token});

  final String? usermail;
  final String? password;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(usermail: json['usermail'], password: json['password'], token: json['token']);
}