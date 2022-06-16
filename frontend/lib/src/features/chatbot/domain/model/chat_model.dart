class ChatBotModel {
  String? intentName;
  String? userQuery;
  String? fulfillmentText;

  ChatBotModel({this.intentName, this.userQuery, this.fulfillmentText});

  ChatBotModel.fromJson(Map<String, dynamic> json) {
    intentName = json['intentName'];
    userQuery = json['userQuery'];
    fulfillmentText = json['fulfillmentText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intentName'] = this.intentName;
    data['userQuery'] = this.userQuery;
    data['fulfillmentText'] = this.fulfillmentText;
    return data;
  }
}
