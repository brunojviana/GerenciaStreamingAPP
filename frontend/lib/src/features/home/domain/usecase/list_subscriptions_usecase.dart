import 'package:flutter_modular/flutter_modular.dart';

import '../model/subscription.dart';
import '../repository/list_subs_interface.dart';

class ListSubsUseCase {
  final repository = Modular.get<IListSubs>();

  Future<List<Subscription>> loadSubs(int idUser) {
    return repository.loadSubs(idUser);
  }
}