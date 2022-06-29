import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../domain/model/calendar.dart';
import '../../domain/usecase/spending_history_usecase.dart';

part 'spending_history_viewmodel.g.dart';

class SpendingHistoryViewModel = _SpendingHistoryViewModelBase with _$SpendingHistoryViewModel;
abstract class _SpendingHistoryViewModelBase with Store {
  final _usecase = Modular.get<SpendingHistoryUseCase>();

  double calculateTotalSpending(List<SubscriptionCalendar> spendings) {
    
    double total = 0;
    
    if (spendings.isNotEmpty)
    {
      for (int i=0; i<spendings.length; i++)
      {
        total = total + spendings[i].spending!;
      }
      return total;
    }
    else
    {
      return 0;
    }
  }

  Future<List<SubscriptionCalendar?>> loadSpendingHistory(int userId) async {
    
    List<SubscriptionCalendar?> res = await _usecase.loadSpendingHistory(userId);
    return res;
  }
}