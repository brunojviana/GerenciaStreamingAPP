import 'package:frontend/src/features/home/domain/model/userProfile.dart';
import 'package:frontend/src/features/auth/domain/model/user.dart';
import '../../domain/repository/profile_interface.dart';

class HomeRepository implements IProfile {
  @override
  Future<UserProfile> getProfile(User user) async {
    throw UnimplementedError();
  }
}