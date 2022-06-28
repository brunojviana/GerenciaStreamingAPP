import 'package:flutter/material.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../../subscription/domain/model/provider.dart';
import '../../../domain/model/content.dart';
import '../../viewmodel/select_subscription_viewmodel.dart';

class SelectSubscriptionPage extends StatefulWidget {
  final List<Subscription> subs;
  const SelectSubscriptionPage({Key? key, required this.subs}) : super(key: key);

  @override
  State<SelectSubscriptionPage> createState() => _SelectSubscriptionPageState();
}

class _SelectSubscriptionPageState extends ModularState<SelectSubscriptionPage, SelectSubscriptionViewModel> {
  late ThemeData _theme;
  late List<Subscription> _subscriptions;
  late Profile _profile;
  late List<Content> _contents;
  
  Widget get _message => Container(
    margin: const EdgeInsets.fromLTRB(10, 100, 10, 10),
    height: 20,
    width: double.infinity,
    child: Text('select_subscription_hint'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.center,
    ),
  );

  Widget get _grid => Center(
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5),
      padding: const EdgeInsets.all(40),
      itemCount: widget.subs.length,
      itemBuilder: (context,index) {
        final subscription = widget.subs[index];
                
        return GestureDetector(
          onTap: () async {
            _profile = await store.getSavedUser();
            _contents = await store.loadContents(subscription.id);
            Modular.to.pushNamed("listcontents/${subscription.id}", arguments: _contents);
          },
          child: GridTile(
            child: Center(
              child: Image.asset(subscription.provider!.path_image,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    ),
  );

  Future<List<Subscription>> _loadSubscriptions(int userId) async {
    List<Subscription> response = await store.loadSubscriptions(userId);
    return response;
  }

  @override
  Widget build(BuildContext context)  {
    _theme = Theme.of(context);
    //_subscriptions = _loadSubscriptions(widget.profile.id!) as List<Subscription>; 

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('select_subscription'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _message,
            _grid,
          ],
        ),
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
                onPressed: () async {
                  _profile = await store.getSavedUser();
                  Modular.to.pushNamed('/home', arguments: _profile);
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