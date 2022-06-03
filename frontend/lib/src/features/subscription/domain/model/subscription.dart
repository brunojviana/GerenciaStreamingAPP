
import 'package:frontend/src/features/subscription/domain/model/provider.dart';

class Subscription {
  const Subscription({this.id, this.provider, this.signatureDate, this.price,
                     this.periodPayment, this.screens, this.maxResolution,
                     this.content, this.time, this.status});
  
  final int? id;
  final Provider? provider;
  final DateTime? signatureDate;
  final double? price;
  final String? periodPayment;
  final int? screens;
  final String? maxResolution;
  final int? content;
  final Duration? time;
  final int? status;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      Subscription(id: json['id'], provider: json['provider'], signatureDate: json['signatureDate'],
                   price: json['price'], periodPayment: json['periodPayment'], screens: json['screens'],
                   maxResolution: json['maxResolution'], content: json['content'], time: json['time'],
                   status: json['status']);
}