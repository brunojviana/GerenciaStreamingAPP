import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/features/auth/domain/model/user.dart';
import 'package:frontend/src/features/subscription/domain/model/provider.dart';

class Subscription {
  const Subscription({
    this.id, 
    this.provider,
    this.user, 
    this.signatureDate, 
    this.price,
    this.periodPayment, 
    this.screens, 
    this.maxResolution,
    this.content, 
    this.useTime, 
    this.status,
    this.providerId,
    this.userId});
  
  final int? id;
  final Provider? provider;
  final Profile? user;
  final String? signatureDate;
  final double? price;
  final String? periodPayment;
  final int? screens;
  final String? maxResolution;
  final int? content;
  final double? useTime;
  final int? status;
  final int? providerId;
  final int? userId;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
    Subscription(
      id: json['id'],
      signatureDate: json['date_signature'],
      screens: json['screens'],
      maxResolution: json['max_resolution'], 
      price: json['price'], 
      periodPayment: json['period_payment'], 
      content: json['num_content'], 
      useTime: json['time'],
      status: json['status'],
      providerId: json['provider_id'],
      userId: json['user_id'],
      provider: Provider.fromJson(json['provider']),
      user: Profile.fromJson(json['user']));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_signature'] = this.signatureDate;
    data['screens'] = this.screens;
    data['max_resolution'] = this.maxResolution;
    data['price'] = this.price;
    data['period_payment'] = this.periodPayment;
    data['num_content'] = this.content;
    data['time'] = this.useTime;
    data['status'] = this.status;
    data['provider_id'] = this.providerId;
    data['user_id'] = this.userId;
    data['provider'] = this.provider?.toJson();
    data['user'] = this.user?.toJson();
    return data;
  }
}