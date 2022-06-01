import 'package:flutter_modular/flutter_modular.dart';
import '../../../auth/data/dto/user_dto.dart';
import '../model/content.dart';
import '../repository/list_contents_interface.dart';

class ListContentsUseCase {
  final repository = Modular.get<IListContents>();

  Future<List<Content>> loadContents(UserDto user) {
    return repository.loadContents(user);
  }
}