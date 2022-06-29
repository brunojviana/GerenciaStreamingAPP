import '../../../auth/domain/model/profile.dart';
import '../../../subscription/domain/model/subscription.dart';

abstract class IRecommendation {
  Future<List<Subscription>?> calculateSubset(double amount, int idUser);
}