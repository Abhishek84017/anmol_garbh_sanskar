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
    final Map<String, dynamic> FiveQModel = new Map<String, dynamic>();
    FiveQModel['id'] = this.id;
    FiveQModel['day'] = this.day;
    FiveQModel['title'] = this.title;
    FiveQModel['description'] = this.description;
    FiveQModel['video_link'] = this.videoLink;
    FiveQModel['image'] = this.image;
    FiveQModel['inserted'] = this.inserted;
    FiveQModel['inserted_by'] = this.insertedBy;
    FiveQModel['modified'] = this.modified;
    FiveQModel['modified_by'] = this.modifiedBy;
    FiveQModel['status'] = this.status;
    return FiveQModel;
  }
}