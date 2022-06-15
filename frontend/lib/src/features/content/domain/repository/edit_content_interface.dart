import '../../data/dto/content_dto.dart';
import '../model/content.dart';

abstract class IEditContent {
  Future<Content?> editContent(ContentDto content);
}