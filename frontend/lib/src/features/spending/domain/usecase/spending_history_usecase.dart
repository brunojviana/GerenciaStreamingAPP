import 'package:flutter_modular/flutter_modular.dart';
import '../../../spending/domain/model/calendar.dart';
import '../repository/spending_history_interface.dart';

class SpendingHistoryUseCase {
  final repository = Modular.get<ISpendingHistory>();

  Future<List<SubscriptionCalendar>> loadSpendingHistory(int userId) {
    return repository.loadSpendingHistory(userId);
  }
}