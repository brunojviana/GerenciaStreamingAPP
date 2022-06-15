import 'package:image_picker/image_picker.dart';

class Profile {
  const Profile({
    this.id, 
    this.photo, 
    this.cpf, 
    this.name, 
    this.email, 
    this.dateBirth, 
    this.password});

  final int? id;
  final XFile? photo;
  final String? cpf;
  final String? name;
  final String? email;
  final String? dateBirth;
  final String? password;

  factory Profile.fromJson(Map<String, dynamic> json) =>
    Profile(
      id: json['id'],
      photo: json['photo'], 
      cpf: json['cpf'],
      name: json['name'], 
      email: json['email'], 
      dateBirth: json['dateBirth'],
      password: json['password']
    );
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['cpf'] = this.cpf;
    data['name'] = this.name;
    data['email'] = this.email;
    data['dateBirth'] = this.dateBirth;
    data['password'] = this.password;
    return data;
  }
  
}