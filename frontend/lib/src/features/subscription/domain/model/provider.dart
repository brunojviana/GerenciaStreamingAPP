class Provider {
  const Provider({this.pathLogo, this.name, this.category});
  
  final String? pathLogo;
  final String? name;
  final String? category;

  factory Provider.fromJson(Map<String, dynamic> json) =>
      Provider(pathLogo: json['pathLogo'], name: json['name'], category: json['category']);
}