import '../../../subscription/domain/model/provider.dart';
import '../../../subscription/domain/model/subscription.dart';

class Content {
  Content({
    this.id, 
    required this.subscriptionId, 
    this.name, 
    this.category, 
    required this.startDate, 
    required this.lastAccess, 
    this.time, 
    this.status,
    this.subscription});
  
  final int? id;
  final int subscriptionId;
  final String? name;
  final String? category;
  late String startDate;
  late String lastAccess;
  late int? time;
  late int? status;
  final Subscription? subscription;

  factory Content.fromJson(Map<String, dynamic> json) =>
    Content(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      startDate: json['start'],
      lastAccess: json['last_acess'],
      time: json['watch_time'], 
      status: json['status'],
      subscriptionId: json['signature_id'],
      subscription: Subscription.fromJson(json['signature'])
    );

    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['start'] = this.startDate;
    data['last_acess'] = this.lastAccess;
    data['watch_time'] = this.time;
    data['status'] = this.status;
    data['signature_id'] = this.subscriptionId;
    data['user'] = this.subscription?.toJson();
    return data;
  }
}