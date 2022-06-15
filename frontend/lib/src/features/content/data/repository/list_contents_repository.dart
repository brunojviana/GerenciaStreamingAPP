import '../../domain/model/content.dart';
import '../../domain/repository/list_contents_interface.dart';

class ListContentsRepository implements IListContents {
  @override
  Future<List<Content>> loadContents(int userId) async {
    throw UnimplementedError();
  }
}