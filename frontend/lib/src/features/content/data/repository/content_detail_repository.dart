import '../../domain/repository/content_detail_interface.dart';

class ContentDetailRepository implements IContentDetail {
  
  @override
  Future<int> switchStatus(int status) async {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteContent(int id) async {
    throw UnimplementedError();
  }
}