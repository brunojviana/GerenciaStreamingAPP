class UserRegister {
  const UserRegister(this.cpf, this.name, this.email, this.dateBirth, this.password);

  final String cpf;
  final String name;
  final String email;
  final String dateBirth;
  final String password;

  factory UserRegister.fromJson(Map<String, dynamic> json) =>
      UserRegister(json['cpf'], json['name'], json['email'], json['dateBirth'], json['password']);
}