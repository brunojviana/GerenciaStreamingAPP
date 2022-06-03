import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../auth/domain/model/user.dart';
import '../../../subscription/domain/model/provider.dart';
import '../../data/dto/content_dto.dart';
import '../repository/register_content_interface.dart';

class RegisterContentUseCase {
  final repository = Modular.get<IRegisterContent>();

  String? validateName(String name) {
    
    if (name.isEmpty) {
      return 'name_content_required'.i18n();
    }
    return null;
  }

  String? validateCategory(String category) {
    if (category.isEmpty) {
      return 'category_required'.i18n(); 
    }
    return null;
  }

  Future<int> registerContent(User user, int subscriptionId, Provider provider, String name, String category) {
    return repository.registerContent(ContentDto(user, subscriptionId, provider, name, category));
  }
}
