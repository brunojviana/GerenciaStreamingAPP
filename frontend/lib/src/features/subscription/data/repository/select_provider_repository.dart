import 'dart:convert';

import '../../domain/model/provider.dart';
import '../../domain/repository/select_provider_interface.dart';
import 'package:http/http.dart' as http;

class SelectProviderRepository implements IListProviders {
  @override
  Future<List<Provider>> loadProviders() async {
    List<Provider> providers = [];
    Provider provider;

    final res = await http.get(
      Uri.http('192.168.0.136:3000', '/providers')
    );

    if (res.body.isNotEmpty) {
      final List<dynamic> data = jsonDecode(res.body);

      data.forEach((p) {
        provider = Provider.fromJson(p);
        providers.add(provider);
      });
    }

    return providers;
  }
}