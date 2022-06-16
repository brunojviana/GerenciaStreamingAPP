import '../../domain/model/content.dart';
import '../../domain/repository/edit_content_interface.dart';
import '../dto/content_dto.dart';

class EditContentRepository implements IEditContent {
  
  @override
  Future<Content?> editContent(ContentDto content) async {
    throw UnimplementedError();
  }
}