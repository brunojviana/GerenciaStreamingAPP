import '../../domain/model/content.dart';
import '../../domain/repository/register_content_interface.dart';
import '../dto/content_dto.dart';

class RegisterContentRepository implements IRegisterContent {
  
  @override
  Future<Content?> registerContent(ContentDto content) async {
    throw UnimplementedError();
  }
}