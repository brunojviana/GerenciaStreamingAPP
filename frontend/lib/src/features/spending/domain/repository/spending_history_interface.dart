import '../model/calendar.dart';

abstract class ISpendingHistory {
  Future<List<SubscriptionCalendar>> loadSpendingHistory(int userId);
}