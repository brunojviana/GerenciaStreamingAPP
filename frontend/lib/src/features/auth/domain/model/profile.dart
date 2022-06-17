import 'package:image_picker/image_picker.dart';

class Profile {
  const Profile({
    this.id, 
    this.path_image, 
    this.cpf, 
    this.name, 
    this.email, 
    this.dateBirth, 
    this.password,
    this.access_token});

  final int? id;
  final String? path_image;
  final String? cpf;
  final String? name;
  final String? email;
  final String? dateBirth;
  final String? password;
  final String? access_token;

  factory Profile.fromJson(Map<String, dynamic> json) =>
    Profile(
      id: json['id'],
      path_image: json['path_image'], 
      cpf: json['cpf'],
      name: json['name'], 
      email: json['email'], 
      dateBirth: json['dateBirth'],
      password: json['password'],
      access_token: json['access_token']
    );
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path_image'] = this.path_image;
    data['cpf'] = this.cpf;
    data['name'] = this.name;
    data['email'] = this.email;
    data['dateBirth'] = this.dateBirth;
    data['password'] = this.password;
    data['access_token'] = this.access_token;
    return data;
  }
  
}