import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/subscription/data/dto/provider_dto.dart';
import 'package:localization/localization.dart';
import '../repository/provider_interface.dart';

class RegisterProviderUseCase {
  final repository = Modular.get<IProvider>();
     
  String? validateName(String name) {
    if (name.isEmpty) {
      return 'name_provider'.i18n();
    }
    return null;
  }

  String? validateCategory(String category) {
    if (category.isEmpty) {
      return 'name_required'.i18n(); 
    }
    return null;
  }

  Future<ProviderDto> registerProvider(String pathLogo, String name, String category) {
    return repository.registerProvider(ProviderDto(pathLogo, name, category));
  }
}