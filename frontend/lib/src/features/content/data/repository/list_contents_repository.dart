import 'dart:convert';

import '../../domain/model/content.dart';
import '../../domain/repository/list_contents_interface.dart';
import 'package:http/http.dart' as http;

class ListContentsRepository implements IListContents {
  @override
  Future<List<Content>> loadContents(int idSub) async {
    List<Content> contents = [];
    Content content;

    final res = await http.get(
      Uri.http('192.168.0.136:3000', "/contents/all/${idSub.toString()}")
    );

    if (res.body.isNotEmpty) {
      final List<dynamic> data = jsonDecode(res.body);

      data.forEach((s) {
        content = Content.fromJson(s);
        contents.add(content);
      });
    }

    return contents;
  }
}