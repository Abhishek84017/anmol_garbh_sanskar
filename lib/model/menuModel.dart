class MenuModel {
  int? id;
  String? title;
  String? description;
  String? parentId;
  String? position;
  String? icon;
  String? type;
  String? status;
  String? insertedBy;
  String? inserted;


  MenuModel(
      {this.id,
        this.title,
        this.description,
        this.parentId,
        this.position,
        this.icon,
        this.type,
        this.status,
        this.insertedBy,
        this.inserted,
     });

  MenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    parentId = json['parent_id'];
    position = json['position'];
    icon = json['icon'];
    type = json['type'];

    status = json['status'];
    insertedBy = json['inserted_by'];
    inserted = json['inserted'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> MenuModel = <String, dynamic>{};
    MenuModel['id'] = id;
    MenuModel['title'] = title;
    MenuModel['description'] = description;
    MenuModel['parent_id'] = parentId;
    MenuModel['position'] = position;
    MenuModel['icon'] = icon;
    MenuModel['type'] = type;

    MenuModel['status'] = status;
    MenuModel['inserted_by'] = insertedBy;
    MenuModel['inserted'] = inserted;

    return MenuModel;
  }
}