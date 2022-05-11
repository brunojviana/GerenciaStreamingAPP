import '../../../auth/domain/model/user.dart';
import '../model/userProfile.dart';

abstract class IProfile {
  Future<UserProfile> getProfile(User user);
}