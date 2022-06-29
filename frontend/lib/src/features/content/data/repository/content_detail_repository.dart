import 'dart:convert';

import '../../domain/model/content.dart';
import '../../domain/repository/content_detail_interface.dart';
import 'package:http/http.dart' as http;

class ContentDetailRepository implements IContentDetail {
  
  @override
  Future<Content> switchStatus(int status, Content content) async {
    Content _cnt;

    final res = await http.put(
      Uri.http('192.168.0.136:3000', '/contents'), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "id": content.id,
        "name": content.name,
        "category": content.category,
        "start": content.startDate,
        "last_acess": content.lastAccess,
        "watch_time": content.time,
        "status": content.status,
        "signature_id": content.subscriptionId
      }),
    );

    final Map<String, dynamic> data = jsonDecode(res.body);
    _cnt = Content.fromJson(data);
    print(_cnt.toJson());
    return _cnt;
  }

  @override
  Future<int> deleteContent(int id) async {
    final res = await http.delete(
      Uri.http('192.168.0.136:3000', "/contents/${id.toString()}")
    );

    return res.statusCode;
  }
}