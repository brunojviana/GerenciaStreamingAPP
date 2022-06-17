import 'package:image_picker/image_picker.dart';

class UserRegisterDto {
  const UserRegisterDto(this.path_image, this.cpf, this.name, this.email, this.dateBirth, this.password, this.access_token);

  final String? path_image; 
  final String cpf;
  final String name;
  final String email;
  final String dateBirth;
  final String password;
  final String? access_token;
}