import '../../data/dto/content_dto.dart';
import '../model/content.dart';

abstract class IRegisterContent {
  Future<Content?> registerContent(ContentDto content);
}