import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../data/dto/content_dto.dart';
import '../model/content.dart';
import '../repository/edit_content_interface.dart';

class EditContentUseCase {
  final repository = Modular.get<IEditContent>();

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

  Future<Content?> editContent(
    int id, 
    int subscriptionId, 
    String name, 
    String category,
    DateTime startDate,
    DateTime lastAccess,
    int status) {
      return repository.editContent(ContentDto(
        id, 
        subscriptionId,
        name, 
        category,
        startDate,
        lastAccess,
        status)
      );
    }
}
