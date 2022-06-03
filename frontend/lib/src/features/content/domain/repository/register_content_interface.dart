import '../../data/dto/content_dto.dart';

abstract class IRegisterContent {
  Future<int> registerContent(ContentDto content);
}