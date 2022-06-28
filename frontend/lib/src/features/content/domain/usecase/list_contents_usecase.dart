import 'package:flutter_modular/flutter_modular.dart';
import '../model/content.dart';
import '../repository/list_contents_interface.dart';

class ListContentsUseCase {
  final repository = Modular.get<IListContents>();

  Future<List<Content>> loadContents(int idSub) {
    return repository.loadContents(idSub);
  }
}