class Profile {
  const Profile({this.pathProfilePhoto, this.cpf, this.name, this.email, this.dateBirth, this.password});

  final String? pathProfilePhoto;
  final String? cpf;
  final String? name;
  final String? email;
  final String? dateBirth;
  final String? password;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      Profile(pathProfilePhoto: json['pathProfilePhoto'], cpf: json['cpf'],
              name: json['name'], email: json['email'], dateBirth: json['dateBirth'],
              password: json['password']);
}