import '../../../subscription/domain/model/provider.dart';

class Content {
  const Content({this.id, this.provider, this.name, this.category, this.startDate, this.lastAccess, this.time, this.status});
  
  final int? id;
  final Provider? provider;
  final String? name;
  final String? category;
  final DateTime? startDate;
  final DateTime? lastAccess;
  final Duration? time;
  final int? status;

  factory Content.fromJson(Map<String, dynamic> json) =>
      Content(id: json['id'], provider: json['provider'], name: json['name'],
                  category: json['category'], startDate: json['startDate'],
                  lastAccess: json['lastAccess'], time: json['time'], status: json['status']);
}