import 'package:flutter/material.dart';
import 'package:frontend/src/features/spending/domain/model/calendar.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/spending.dart';
import '../../viewmodel/spending_history_viewmodel.dart';

class SpendingHistoryPage extends StatefulWidget {
  final Profile profile;
  const SpendingHistoryPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<SpendingHistoryPage> createState() => _SpendingHistoryPageState();
}

class _SpendingHistoryPageState extends ModularState<SpendingHistoryPage, SpendingHistoryViewModel> {
  late ThemeData _theme;
  late List<SubscriptionCalendar> _data;
  late List<SpendingPerSubscription> _dataSub;

  Future<List<SubscriptionCalendar?>> _loadSpendingHistory(int userId) async {
    List<SubscriptionCalendar?> response = await store.loadSpendingHistory(userId);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _data = [
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 'January',
        year: 2022,
        spending: 35.0,
        useTime: 15.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 'February',
        year: 2022,
        spending: 40.0,
        useTime: 18.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 'March',
        year: 2022,
        spending: 40.0,
        useTime: 35.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 'April',
        year: 2022,
        spending: 40.0,
        useTime: 30.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 'May',
        year: 2022,
        spending: 50.0,
        useTime: 20.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 'June',
        year: 2022,
        spending: 50.0,
        useTime: 10.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 2,
        month: 'January',
        year: 2022,
        spending: 15.0,
        useTime: 17.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 2,
        month: 'February',
        year: 2022,
        spending: 15.0,
        useTime: 12.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 2,
        month: 'March',
        year: 2022,
        spending: 25.0,
        useTime: 30.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 2,
        month: 'April',
        year: 2022,
        spending: 25.0,
        useTime: 25.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 2,
        month: 'May',
        year: 2022,
        spending: 25.0,
        useTime: 19.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 2,
        month: 'June',
        year: 2022,
        spending: 30.0,
        useTime: 13.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 3,
        month: 'January',
        year: 2022,
        spending: 25.0,
        useTime: 10.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 3,
        month: 'February',
        year: 2022,
        spending: 22.0,
        useTime: 5.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 3,
        month: 'March',
        year: 2022,
        spending: 22.0,
        useTime: 30.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 3,
        month: 'April',
        year: 2022,
        spending: 28.0,
        useTime: 15.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 3,
        month: 'May',
        year: 2022,
        spending: 28.0,
        useTime: 10.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 3,
        month: 'June',
        year: 2022,
        spending: 28.0,
        useTime: 15.0,
      ),
    ];
  _dataSub = [
    SpendingPerSubscription(
      subscriptionName: 'Netflix',
      spending: 255.0),
    SpendingPerSubscription(
      subscriptionName: 'Amazon Prime Video',
      spending: 135.0),
    SpendingPerSubscription(
      subscriptionName: 'HBO Max',
      spending: 175.0),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('spending_title'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        centerTitle: true,
        ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BarChartWidget(data: _data),
              PieChartWidget(data: _dataSub),
              BarChartWidget2(data: _data)
            ],
          ),
        ),
      ),
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
                  Modular.to.pushNamed('/home', arguments: widget.profile);
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

class BarChartWidget extends StatelessWidget {
  final List<SubscriptionCalendar> data;

  const BarChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriptionCalendar, String>> series =
    [
      charts.Series(
        id: "Spendings",
        data: data,
        domainFn: (SubscriptionCalendar series, _) =>
          series.month.toString(),
        measureFn: (SubscriptionCalendar series, _) =>
          series.spending,
      )
    ];

    return Container(
      height: 250,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('monthly_spending'.i18n(),
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true)
              ),
            ],
          )
        )
      )
    );
  }
}

class PieChartWidget extends StatelessWidget {
  final List<SpendingPerSubscription> data;

  const PieChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SpendingPerSubscription, String>> series =
    [
      charts.Series(
        id: "Spendings",
        data: data,
        domainFn: (SpendingPerSubscription series, _) =>
          series.subscriptionName!,
        measureFn: (SpendingPerSubscription series, _) =>
          series.spending,
        labelAccessorFn: (SpendingPerSubscription row, _) => 
          '${row.subscriptionName}}: ${row.spending}',
      )
    ];    

    return Container(
      height: 250,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('spending_per_subscription'.i18n(),
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: charts.PieChart(
                  series,
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.outside
                    )]
                  ), 
                ),   
              ),
            ],
          )
        )
      )
    );
  }
}

class BarChartWidget2 extends StatelessWidget {
  final List<SubscriptionCalendar> data;

  const BarChartWidget2({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriptionCalendar, String>> series =
    [
      charts.Series(
        id: "Spendings",
        data: data,
        domainFn: (SubscriptionCalendar series, _) =>
          series.month.toString(),
        measureFn: (SubscriptionCalendar series, _) =>
          (series.spending! / series.useTime!),
      )
    ];

    return Container(
      height: 250,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('spending_per_hour'.i18n(),
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true)
              ),
            ],
          )
        )
      )
    );
  }
}
