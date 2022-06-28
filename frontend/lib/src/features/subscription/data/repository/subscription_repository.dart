import 'dart:convert';

import 'package:frontend/src/features/subscription/domain/repository/register_subscription_interface.dart';
import '../../domain/model/subscription.dart';
import '../dto/subscription_dto.dart';
import 'package:http/http.dart' as http;

class SubscriptionRepository implements ISubscription {
  @override
  Future<Subscription?> registerSubscription(SubscriptionDto subscription) async {
    Subscription _sub;
    try {
      final res = await http.post(
        Uri.http('192.168.0.136:3000', '/signatures'), 
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "date_signature": subscription.signatureDate,
          "screens": subscription.screens,
          "max_resolution": subscription.maxResolution,
          "price": subscription.price,
          "period_payment": subscription.periodPayment,
          "num_content": subscription.content,
          "time": subscription.useTime,
          "status": subscription.status,
          "provider_id": subscription.idProvider,
          "user_id": subscription.userId
        }),
      );
      final Map<String, dynamic> data = jsonDecode(res.body);
      _sub = Subscription.fromJson(data);
      return _sub;
    } on Error catch (e) {
      print(e);
      return null;
    }
  }
}