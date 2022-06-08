import 'package:image_picker/image_picker.dart';

class UserRegisterDto {
  const UserRegisterDto(this.photo, this.cpf, this.name, this.email, this.dateBirth, this.password);

  final XFile? photo; 
  final String cpf;
  final String name;
  final String email;
  final String dateBirth;
  final String password;
}