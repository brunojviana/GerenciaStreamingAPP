import 'package:flutter/material.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/provider.dart';
import '../../viewmodel/list_subscriptions_viewmodel.dart';

class ListSubscriptionsPage extends StatefulWidget {
  final List<Subscription> subscriptions;
  const ListSubscriptionsPage({Key? key, required this.subscriptions}) : super(key: key);
  
  @override
  State<ListSubscriptionsPage> createState() => _ListSubscriptionsPageState();
}

class _ListSubscriptionsPageState extends ModularState<ListSubscriptionsPage, ListSubscriptionsViewModel> {
  late ThemeData _theme;
  late List<Subscription> _subscriptions;
  late List<Provider> providers;
  late DateTime data;

  Widget get _dataSubscription => Center(
    child: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.subscriptions.length,
        itemBuilder: (context, index) {
          final subscription = widget.subscriptions[index];
          data = DateTime.parse(subscription.signatureDate!);
          
          return Card(
            child: ListTile(
              onTap: () {
                Modular.to.pushNamed('detailsubscription', arguments: widget.subscriptions[index]);
              },
              title: Text(subscription.provider!.name!,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                ),
              ),
              subtitle: Text(
                subscription.provider!.category!.i18n() + '\n' +
                'signature_date'.i18n() + ': ' + 
                data.day.toString() + '/' +
                data.month.toString() + '/' +
                data.year.toString() + '\n' +
                'price'.i18n() + ': ' + 'currency'.i18n() +
                subscription.price.toString() + '\n' +
                'status'.i18n() + ': ' +
                _verifyStatus(subscription),
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text, 
                  ),
                ),
              minLeadingWidth: 80,
              leading: Image.asset(subscription.provider!.path_image!,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      )
    ),
  );

  String _verifyStatus(Subscription subscription) {
    if (subscription.status == 0) {
      return 'status_inactive'.i18n();
    }
    else {
      return 'status_active'.i18n();
    }
  }

  Future<void> _load() async {
    final res = await store.loadProviders();
    providers = res;
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('my_subscriptions'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        centerTitle: true,
        ),
      body: _dataSubscription, 
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,
          size: 40,
          color: AppColors.textLight),
        backgroundColor: AppColors.primary,
        onPressed: () async {
          await _load();
          Modular.to.pushNamed('selectprovider', arguments: providers);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 45.0,
              child: IconButton(
                icon: const Icon(Icons.home, color: AppColors.textLight),
                iconSize: 35,
                onPressed: () {
                  Modular.to.pushNamed('/home', arguments: widget.subscriptions[0].userId);
                }
              ),
            ),
            SizedBox(
              height: 45.0,
              child: IconButton(
                icon: const Icon(Icons.logout, color: AppColors.textLight),
                iconSize: 35,
                onPressed: () {
                  Modular.to.pushNamed('/auth');
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}