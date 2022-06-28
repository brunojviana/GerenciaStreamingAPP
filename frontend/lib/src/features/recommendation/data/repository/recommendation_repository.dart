import '../../../subscription/domain/model/subscription.dart';
import '../../domain/repository/recommendation_interface.dart';

class RecommendationRepository implements IRecommendation {
  @override
  Future<List<Subscription>?> calculateSubset(double amount) async {
    throw UnimplementedError();
  }
}