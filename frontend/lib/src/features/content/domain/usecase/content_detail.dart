import 'package:flutter_modular/flutter_modular.dart';
import '../repository/content_detail_interface.dart';

class ContentDetailUseCase {
  final repository = Modular.get<IContentDetail>();

  Future<int> switchStatus(int status) {
    return repository.switchStatus(status);
  }

  Future<int> deleteContent(int id) {
    return repository.deleteContent(id);
  }
}