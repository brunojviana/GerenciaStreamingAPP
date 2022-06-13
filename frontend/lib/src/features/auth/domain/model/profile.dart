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
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pathProfilePhoto'] = this.pathProfilePhoto;
    data['cpf'] = this.cpf;
    data['name'] = this.name;
    data['email'] = this.email;
    data['dateBirth'] = this.dateBirth;
    data['password'] = this.password;
    return data;
  }
  
}