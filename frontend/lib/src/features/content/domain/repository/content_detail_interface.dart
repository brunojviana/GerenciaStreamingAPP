import '../model/content.dart';

abstract class IContentDetail {
  Future<Content> switchStatus(int status, Content content);
  Future<int> deleteContent(int id);
}