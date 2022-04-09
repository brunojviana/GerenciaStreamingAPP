class UserRegisterDto {
  const UserRegisterDto(this.cpf, this.name, this.email, this.birthdate, this.password);

  final String cpf;
  final String name;
  final String email;
  final String birthdate;
  final String password;
}