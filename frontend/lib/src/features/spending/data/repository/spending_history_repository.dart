import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:frontend/src/features/spending/domain/model/calendar.dart';
import '../../domain/repository/spending_history_interface.dart';

class SpendingHistoryRepository implements ISpendingHistory {
  @override
  Future<List<SubscriptionCalendar>> loadSpendingHistory(int userId) async {
    throw UnimplementedError();
  }
}