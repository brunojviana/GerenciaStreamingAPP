import 'package:localization/colored_print/print_color.dart';

import '../model/subscription.dart';

abstract class IListSubscriptions {
  Future<List<Subscription>> loadSubs(int idUser);
}