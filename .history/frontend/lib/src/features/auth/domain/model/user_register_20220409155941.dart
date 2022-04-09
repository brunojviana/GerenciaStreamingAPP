class UserRegister {
  const UserRegister(this.cpf, this.name, this.email, this.birthdate, this.password);

  final String cpf;
  final String name;
  final String email;
  final String birthdate;
  final String? password;

  factory UserRegister.fromJson(Map<String, dynamic> json) =>
      UserRegister(json['cpf'], json['name'], json['email'], json['birthdate'],
                       json['password']);
}