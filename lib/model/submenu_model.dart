class SubMenuHomepageModel {
  int? id;
  String? title;
  String? description;
  String? parentId;
  String? position;
  String? icon;
  String? type;
  String? content;
  String? status;
  String? insertedBy;
  String? inserted;
  String? modifiedBy;
  String? modified;

  SubMenuHomepageModel(
      {this.id,
        this.title,
        this.description,
        this.parentId,
        this.position,
        this.icon,
        this.type,
        this.content,
        this.status,
        this.insertedBy,
        this.inserted,
        this.modifiedBy,
        this.modified});

  SubMenuHomepageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    parentId = json['parent_id'];
    position = json['position'];
    icon = json['icon'];
    type = json['type'];
    content = json['content'];
    status = json['status'];
    insertedBy = json['inserted_by'];
    inserted = json['inserted'];
    modifiedBy = json['modified_by'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['icon'] = icon;
    data['type'] = type;
    data['content'] = content;
    data['status'] = status;
    data['inserted_by'] = insertedBy;
    data['inserted'] = inserted;
    data['modified_by'] = modifiedBy;
    data['modified'] = modified;
    return data;
  }
}