import '../model/content.dart';

abstract class IListContents {
  Future<List<Content>> loadContents(int userId);
}