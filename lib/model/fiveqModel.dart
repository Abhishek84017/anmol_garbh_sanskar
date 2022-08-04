class FiveQModel {
  int? id;
  String? day;
  String? title;
  String? description;
  String? videoLink;
  String? image;
  String? inserted;
  String? insertedBy;
  String? modified;
  String? modifiedBy;
  String? status;

  FiveQModel(
      {this.id,
        this.day,
        this.title,
        this.description,
        this.videoLink,
        this.image,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.status});

  FiveQModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    title = json['title'];
    description = json['description'];
    videoLink = json['video_link'];
    image = json['image'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> FiveQModel = <String, dynamic>{};
    FiveQModel['id'] = id;
    FiveQModel['day'] = day;
    FiveQModel['title'] = title;
    FiveQModel['description'] = description;
    FiveQModel['video_link'] = videoLink;
    FiveQModel['image'] = image;
    FiveQModel['inserted'] = inserted;
    FiveQModel['inserted_by'] = insertedBy;
    FiveQModel['modified'] = modified;
    FiveQModel['modified_by'] = modifiedBy;
    FiveQModel['status'] = status;
    return FiveQModel;
  }
}