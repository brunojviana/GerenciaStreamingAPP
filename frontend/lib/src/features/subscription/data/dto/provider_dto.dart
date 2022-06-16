import 'package:image_picker/image_picker.dart';

class ProviderDto {
  const ProviderDto(this.logo, this.name, this.category);
  
  final XFile? logo;
  final String name;
  final String category;
}