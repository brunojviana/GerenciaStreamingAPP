class Provider {
  const Provider({
    this.id, 
    this.pathLogo, 
    this.name, 
    this.category}
  );
  
  final int? id;
  final String? pathLogo;
  final String? name;
  final String? category;

  factory Provider.fromJson(Map<String, dynamic> json) =>
    Provider(
      id: json['id'], 
      pathLogo: json['pathLogo'], 
      name: json['name'], 
      category: json['category']
    );
}