import 'dart:convert';

import '../../domain/model/subscription.dart';
import '../../domain/repository/subscription_detail_interface.dart';
import 'package:http/http.dart' as http;

class SubscriptionDetailRepository implements ISubscriptionDetail {
  
  @override
  Future<Subscription> switchStatus(Subscription sub, int status) async {
    Subscription _sub;

    final res = await http.put(
      Uri.http('192.168.0.136:3000', '/signatures'), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "id": sub.id,
        "date_signature": sub.signatureDate,
        "screens": sub.screens,
        "max_resolution": sub.maxResolution,
        "price": sub.price,
        "period_payment": sub.periodPayment,
        "num_content": sub.content,
        "time": sub.useTime,
        "status": status,
        "provider_id": sub.providerId,
        "user_id": sub.userId
      }),
    );

    final Map<String, dynamic> data = jsonDecode(res.body);
    _sub = Subscription.fromJson(data);
    return _sub;
  }

  @override
  Future<int> deleteSubscription(int id) async {
    final res = await http.delete(
      Uri.http('192.168.0.136:3000', "/signatures/${id.toString()}")
    );

    return res.statusCode;
  }
}