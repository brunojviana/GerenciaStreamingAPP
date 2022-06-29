import 'package:flutter_modular/flutter_modular.dart';
import '../model/content.dart';
import '../repository/content_detail_interface.dart';

class ContentDetailUseCase {
  final repository = Modular.get<IContentDetail>();

  Future<Content> switchStatus(int status, Content content) {
    return repository.switchStatus(status, content);
  }

  Future<int> deleteContent(int id) {
    return repository.deleteContent(id);
  }
}