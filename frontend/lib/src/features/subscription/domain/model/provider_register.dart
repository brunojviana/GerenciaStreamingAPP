class ProviderRegister {
  const ProviderRegister(this.name, this.category);
  
  final String name;
  final String category;

  factory ProviderRegister.fromJson(Map<String, dynamic> json) =>
      ProviderRegister(json['name'], json['category']);
}