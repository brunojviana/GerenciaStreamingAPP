import 'dart:convert';

import '../../../subscription/domain/model/subscription.dart';
import '../../domain/repository/recommendation_interface.dart';
import 'package:http/http.dart' as http;

class RecommendationRepository implements IRecommendation {
  @override
  Future<List<Subscription>> calculateSubset(double amount, int idUser) async {
    List<Subscription> subs = [];
    Subscription sub;

    final res = await http.get(
      Uri.http('192.168.0.136:3000', '/signatures/recommendations/${idUser.toString()}/${amount.toString()}'), 
      headers: {'Content-Type': 'application/json'}
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