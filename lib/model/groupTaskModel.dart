class GroupTaskModel {
  int? id;
  String? taskGroupId;
  String? title;
  String? description;
  String? type;
  String? content;
  String? day;
  String? inserted;
  String? insertedBy;
  dynamic modified;
  dynamic modifiedBy;
  String? status;
  String? languageKeyword;

  GroupTaskModel(
      {this.id,
      this.taskGroupId,
      this.title,
      this.description,
      this.type,
      this.content,
      this.day,
      this.inserted,
      this.insertedBy,
      this.modified,
      this.modifiedBy,
      this.status,
      this.languageKeyword});

  GroupTaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskGroupId = json['task_group_id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    content = json['content'];
    day = json['day'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    languageKeyword = json['language_keyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task_group_id'] = taskGroupId;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['content'] = content;
    data['day'] = day;
    data['inserted'] = inserted;
    data['inserted_by'] = insertedBy;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['status'] = status;
    data['language_keyword'] = languageKeyword;
    return data;
  }
}
