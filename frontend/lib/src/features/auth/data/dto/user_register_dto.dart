class UserRegisterDto {
  const UserRegisterDto(this.cpf, this.name, this.email, this.dateBirth, this.password);

  final String cpf;
  final String name;
  final String email;
  final String dateBirth;
  final String password;
}