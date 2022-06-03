import '../../../auth/domain/model/user.dart';
import '../../../subscription/domain/model/provider.dart';

class ContentDto {
  const ContentDto(this.user, this.subscriptionId, this.provider, this.name, this.category);
  
  final User user;
  final int subscriptionId;
  final Provider provider;
  final String name;
  final String category;
}