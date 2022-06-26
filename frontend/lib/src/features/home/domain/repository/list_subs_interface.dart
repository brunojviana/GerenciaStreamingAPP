import '../model/subscription.dart';

abstract class IListSubs {
  Future<List<Subscription>> loadSubs(int idUser);
}