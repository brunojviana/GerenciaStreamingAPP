import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/model/subscription.dart';
import '../../domain/repository/list_subs_interface.dart';
import '../../domain/usecase/list_subscriptions_usecase.dart';

class ListSubsRepository implements IListSubs {
  @override
  Future<List<Subscription>> loadSubs(int idUser) async {
    List<Subscription> subs = [];
    Subscription sub;

    final res = await http.get(
      Uri.http('192.168.0.136:3000', '/subscriptions/all', { 'id_user': idUser })
    );

    if (res.body.isNotEmpty) {
      final List<dynamic> data = jsonDecode(res.body);

      data.forEach((s) {
        sub = Subscription.fromJson(s);
        subs.add(sub);
      });
    }

    return subs;
  }
}