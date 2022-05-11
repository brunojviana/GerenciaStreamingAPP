import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/home/domain/model/userProfile.dart';
import '../../../auth/domain/model/user.dart';
import '../repository/profile_interface.dart';

class HomeUseCase {
  final repository = Modular.get<IProfile>();

  Future<UserProfile> getProfile(User user) async {
    return repository.getProfile(user);
  }
}