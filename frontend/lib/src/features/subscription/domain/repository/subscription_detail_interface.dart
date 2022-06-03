abstract class ISubscriptionDetail {
  Future<int> switchStatus(int status);
  Future<int> deleteSubscription(int id);
}