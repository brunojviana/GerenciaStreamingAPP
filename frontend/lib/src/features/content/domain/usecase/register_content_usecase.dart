import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../data/dto/content_dto.dart';
import '../model/content.dart';
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

  Future<Content?> registerContent(
    int subscriptionId,
    String name,
    String category,
    String startDate,
    String lastAccess,
    int status) {
    return repository.registerContent(ContentDto(
      subscriptionId,
      name,
      category,
      startDate,
      lastAccess,
      status)
    );
  }
}
