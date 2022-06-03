import '../model/provider.dart';

abstract class IListProviders {
  Future<List<Provider>> loadProviders();
}