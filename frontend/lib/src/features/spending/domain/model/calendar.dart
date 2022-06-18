class SubscriptionCalendar {

  const SubscriptionCalendar({
    this.subscriptionId,
    this.month,
    this.year,
    this.spending,
    this.useTime}
  );

  final int? subscriptionId;
  final int? month;
  final int? year;
  final double? spending;
  final double? useTime;

  factory SubscriptionCalendar.fromJson(Map<String, dynamic> json) =>
    SubscriptionCalendar(
      subscriptionId: json['subscriptionId'], 
      month: json['month'], 
      year: json['year'], 
      spending: json['spending'],
      useTime: json['useTime']
    );  
}