class ChatBotModel {

  ChatBotModel({this.intentName, this.userQuery, this.fulfillmentText});

  final String? intentName;
  final String? userQuery;
  final String? fulfillmentText;

  factory ChatBotModel.fromJson(Map<String, dynamic> json) =>
    ChatBotModel(intentName: json['intentName'], userQuery: json['userQuery'], fulfillmentText: json['fulfillmentText']);

}

