import 'dart:convert';

import '../../domain/model/subscription.dart';
import '../../domain/repository/edit_subscription_interface.dart';
import '../dto/subscription_dto.dart';
import 'package:http/http.dart' as http;

class EditSubscriptionRepository implements IEditSubscription {
  @override
  Future<Subscription?> editSubscription(Subscription subscription) async {
    Subscription _sub;

    final res = await http.put(
      Uri.http('192.168.0.136:3000', '/signatures'), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "id": subscription.id,
        "date_signature": subscription.signatureDate,
        "screens": subscription.screens,
        "max_resolution": subscription.maxResolution,
        "price": subscription.price,
        "period_payment": subscription.periodPayment,
        "num_content": subscription.content,
        "time": subscription.useTime,
        "status": subscription.status,
        "provider_id": subscription.providerId,
        "user_id": subscription.userId
      }),
    );

    final Map<String, dynamic> data = jsonDecode(res.body);
    _sub = Subscription.fromJson(data);
    return _sub;
  }
}