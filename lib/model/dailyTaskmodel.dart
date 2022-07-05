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
        this.image});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> DailyQTaskModel = new Map<String, dynamic>();
    DailyQTaskModel['id'] = this.id;
    DailyQTaskModel['title'] = this.title;
    DailyQTaskModel['description'] = this.description;
    DailyQTaskModel['video_link'] = this.videoLink;
    DailyQTaskModel['status'] = this.status;
    DailyQTaskModel['inserted'] = this.inserted;
    DailyQTaskModel['inserted_by'] = this.insertedBy;
    DailyQTaskModel['modified'] = this.modified;
    DailyQTaskModel['modified_by'] = this.modifiedBy;
    DailyQTaskModel['image'] = this.image;
    return DailyQTaskModel;
  }
}