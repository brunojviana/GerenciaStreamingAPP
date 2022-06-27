import 'dart:convert';

import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:frontend/src/features/subscription/domain/repository/list_subscriptions_interface.dart';
import '../../domain/model/subscription.dart';
import 'package:http/http.dart' as http;

class ListSubsciptionsRepository implements IListSubscriptions {
  @override
  Future<List<Subscription>> loadSubs(int idUser) async {
    List<Subscription> subs = [];
    Subscription sub;
    print('oi');
    print(idUser);

    final res = await http.get(
      Uri.http('192.168.0.136:3000', "/signatures/all/${idUser.toString()}")
    );
    print(res.body);

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