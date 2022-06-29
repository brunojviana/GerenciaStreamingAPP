import 'dart:convert';

import '../../domain/model/content.dart';
import '../../domain/repository/register_content_interface.dart';
import '../dto/content_dto.dart';
import 'package:http/http.dart' as http;

class RegisterContentRepository implements IRegisterContent {
  
  @override
  Future<Content?> registerContent(ContentDto content) async {
    Content _cnt;

    try {
      final res = await http.post(
        Uri.http('192.168.0.136:3000', '/contents'), 
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": content.name,
          "category": content.category,
          "start": content.startDate,
          "last_acess": content.lastAccess,
          "status": content.status,
          "signature_id": content.subscriptionId
        }),
      );

      final Map<String, dynamic> data = jsonDecode(res.body);
      _cnt = Content.fromJson(data);
      
      return _cnt;
    } on Error catch (e) {
      print(e);
      return null;
    }
  }
}