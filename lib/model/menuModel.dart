class MenuModel {
  int? id;
  String? title;
  String? description;
  String? parentId;
  String? position;
  String? icon;
  String? type;
  Null? content;
  String? status;
  String? insertedBy;
  String? inserted;
  Null? modifiedBy;
  Null? modified;

  MenuModel(
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

  MenuModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> MenuModel = new Map<String, dynamic>();
    MenuModel['id'] = this.id;
    MenuModel['title'] = this.title;
    MenuModel['description'] = this.description;
    MenuModel['parent_id'] = this.parentId;
    MenuModel['position'] = this.position;
    MenuModel['icon'] = this.icon;
    MenuModel['type'] = this.type;
    MenuModel['content'] = this.content;
    MenuModel['status'] = this.status;
    MenuModel['inserted_by'] = this.insertedBy;
    MenuModel['inserted'] = this.inserted;
    MenuModel['modified_by'] = this.modifiedBy;
    MenuModel['modified'] = this.modified;
    return MenuModel;
  }
}