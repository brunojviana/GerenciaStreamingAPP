class Provider {
  const Provider({
    this.id, 
    this.path_image, 
    this.name, 
    this.category}
  );
  
  final int? id;
  final String? path_image;
  final String? name;
  final String? category;

  factory Provider.fromJson(Map<String, dynamic> json) =>
    Provider(
      id: json['id'], 
      path_image: json['path_image'], 
      name: json['name'], 
      category: json['category']
    );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['path_image'] = this.path_image;
    return data;
  }
}