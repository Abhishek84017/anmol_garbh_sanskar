class DailyQTaskModel {
  int? id;
  String? title;
  String? description;
  String? videoLink;
  String? status;
  String? inserted;
  String? insertedBy;
  dynamic modified;
  dynamic modifiedBy;
  dynamic image;
  String? completed;

  DailyQTaskModel(
      {this.id,
        this.title,
        this.description,
        this.videoLink,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.image,this.completed});

  DailyQTaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    videoLink = json['video_link'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    image = json['image'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> DailyQTaskModel = <String, dynamic>{};
    DailyQTaskModel['id'] = id;
    DailyQTaskModel['title'] = title;
    DailyQTaskModel['description'] = description;
    DailyQTaskModel['video_link'] = videoLink;
    DailyQTaskModel['status'] = status;
    DailyQTaskModel['inserted'] = inserted;
    DailyQTaskModel['inserted_by'] = insertedBy;
    DailyQTaskModel['modified'] = modified;
    DailyQTaskModel['modified_by'] = modifiedBy;
    DailyQTaskModel['image'] = image;
    DailyQTaskModel['completed'] = completed;
    return DailyQTaskModel;
  }
}