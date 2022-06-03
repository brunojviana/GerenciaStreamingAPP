abstract class IContentDetail {
  Future<int> switchStatus(int status);
  Future<int> deleteContent(int id);
}