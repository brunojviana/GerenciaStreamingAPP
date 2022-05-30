class SubscriptionRegister {
  const SubscriptionRegister(this.date, this.value, this.payment, this.screens, this.resolution);
  
  final String date;
  final String value;
  final String screens;
  final String payment;
  final String resolution;

  factory SubscriptionRegister.fromJson(Map<String, dynamic> json) =>
      SubscriptionRegister(json['date'], json['value'],json['screens'],json['payment'],json['resolution']);
}