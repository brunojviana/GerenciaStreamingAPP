
class Subscription {
  const Subscription(this.id, this.pathLogo, this.nameProvider, this.categoryProvider, this.signatureDate,
                     this.price, this.periodPayment, this.screens, this.maxResolution,
                     this.content, this.time, this.status);
  
  final int id;
  final String pathLogo;
  final String nameProvider;
  final String categoryProvider;
  final DateTime signatureDate;
  final double price;
  final String periodPayment;
  final int screens;
  final String maxResolution;
  final int content;
  final Duration time;
  final int status;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      Subscription(json['id'], json['pathLogo'], json['nameProvider'], json['categoryProvider'],
                   json['signatureDate'],json['price'],json['periodPayment'],
                   json['screens'], json['maxResolution'], json['content'], 
                   json['time'], json['status']);
}