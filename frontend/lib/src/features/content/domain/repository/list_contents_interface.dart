import '../../../auth/data/dto/user_dto.dart';
import '../model/content.dart';

abstract class IListContents {
  Future<List<Content>> loadContents(UserDto user);
}