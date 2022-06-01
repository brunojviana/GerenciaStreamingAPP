import '../../../subscription/domain/model/provider.dart';

class ContentDto {
  const ContentDto(this.provider, this.name, this.category);
  
  final Provider provider;
  final String name;
  final String category;
}