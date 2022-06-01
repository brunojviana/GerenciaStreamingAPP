import '../../domain/repository/subscription_detail_interface.dart';
class SubscriptionDetailRepository implements ISubscriptionDetail {
  
  @override
  Future<int> switchStatus(int status) async {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteSubscription(int id) async {
    throw UnimplementedError();
  }
}