import '../../domain/repository/content_detail_interface.dart';
import 'package:http/http.dart' as http;

class ContentDetailRepository implements IContentDetail {
  
  @override
  Future<int> switchStatus(int status) async {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteContent(int id) async {
    final res = await http.delete(
      Uri.http('192.168.0.136:3000', "/contents/${id.toString()}")
    );

    return res.statusCode;
  }
}