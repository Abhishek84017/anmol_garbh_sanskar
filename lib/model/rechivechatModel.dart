class ReceiveChatModel {
  int? id;
  String? userId;
  String? message;
  String? type;
  dynamic datetime;

  ReceiveChatModel({this.id, this.userId, this.message, this.type, this.datetime});

  ReceiveChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    message = json['message'];
    type = json['type'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['message'] = message;
    data['type'] = type;
    data['datetime'] = datetime;
    return data;
  }
}