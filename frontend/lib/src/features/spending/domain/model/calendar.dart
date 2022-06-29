class SubscriptionCalendar {

  const SubscriptionCalendar({
    this.id,
    this.subscriptionId,
    this.month,
    this.year,
    this.spending,
    this.useTime}
  );

  final int? id;
  final int? subscriptionId;
  final String? month;
  final int? year;
  final double? spending;
  final double? useTime;

  factory SubscriptionCalendar.fromJson(Map<String, dynamic> json) =>
    SubscriptionCalendar(
      id: json['id'],
      subscriptionId: json['subscriptionId'], 
      month: json['month'], 
      year: json['year'], 
      spending: json['spending'],
      useTime: json['useTime']
    );  
}