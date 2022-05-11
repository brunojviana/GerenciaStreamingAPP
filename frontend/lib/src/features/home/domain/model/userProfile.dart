class UserProfile {
  const UserProfile(this.name, this.email, this.dateBirth, this.profilePicture);

  final String name;
  final String email;
  final String dateBirth;
  final String profilePicture;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      UserProfile(json['name'], json['email'], json['dateBirth'], json['profilePicture']);
}