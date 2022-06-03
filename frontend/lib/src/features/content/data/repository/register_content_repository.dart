import '../../domain/repository/register_content_interface.dart';
import '../dto/content_dto.dart';

class RegisterContentRepository implements IRegisterContent {
  
  @override
  Future<int> registerContent(ContentDto content) async {
    throw UnimplementedError();
  }
}