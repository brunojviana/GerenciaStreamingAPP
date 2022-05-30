import '../../domain/repository/subscription_detail_interface.dart';
import '../dto/subscription_dto.dart';

class SubscriptionDetailRepository implements ISubscriptionDetail {
  
  @override
  Future<int> switchStatus(int status) async {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteSubscription(SubscriptionDto subscription) async {
    throw UnimplementedError();
  }
}