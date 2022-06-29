import 'dart:convert';

import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:frontend/src/features/spending/domain/model/calendar.dart';
import '../../domain/repository/spending_history_interface.dart';
import 'package:http/http.dart' as http;

class SpendingHistoryRepository implements ISpendingHistory {
  @override
  Future<List<SubscriptionCalendar>> loadSpendingHistory(int idSub) async {
    List<SubscriptionCalendar> subCalendars = [];
    SubscriptionCalendar subCalendar;
    
    final res = await http.get(
      Uri.http('192.168.0.136:3000', "/calendars/all/${idSub.toString()}")
    );

    if (res.body.isNotEmpty) {
      final List<dynamic> data = jsonDecode(res.body);

      data.forEach((s) {
        subCalendar = SubscriptionCalendar.fromJson(s);
        subCalendars.add(subCalendar);
      });
    }

    return subCalendars;
  }
}