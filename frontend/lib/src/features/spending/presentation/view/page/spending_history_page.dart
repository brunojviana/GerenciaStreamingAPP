import 'package:flutter/material.dart';
import 'package:frontend/src/features/spending/domain/model/calendar.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../../auth/domain/model/profile.dart';
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
        month: 1,
        year: 2022,
        spending: 50.0,
        useTime: 15.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 2,
        year: 2022,
        spending: 70.0,
        useTime: 18.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 3,
        year: 2022,
        spending: 150.0,
        useTime: 35.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 4,
        year: 2022,
        spending: 100.0,
        useTime: 30.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 5,
        year: 2022,
        spending: 100.0,
        useTime: 20.0,
      ),
      const SubscriptionCalendar(
        subscriptionId: 1,
        month: 6,
        year: 2022,
        spending: 95.0,
        useTime: 10.0,
      ),      
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('spending_history'.i18n(), 
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              BarChartWidget(data: _data),
              PieChartWidget(data: _data),
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
              Text('spending_title'.i18n(),
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
  final List<SubscriptionCalendar> data;

  const PieChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriptionCalendar, String>> series =
    [
      charts.Series(
        id: "Spendings",
        data: data,
        domainFn: (SubscriptionCalendar series, _) =>
          series.subscriptionId.toString(),
        measureFn: (SubscriptionCalendar series, _) =>
          series.spending,
        labelAccessorFn: (SubscriptionCalendar series, _) => 
          '${series.subscriptionId}}: ${series.spending}',
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
              Text('spending_title'.i18n(),
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
                  /*defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.outside
                    )]
                  ), */ 
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
              Text('spending_title'.i18n(),
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