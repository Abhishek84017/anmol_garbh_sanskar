class ReasonModel {
  int? id;
  String? title;
  String? status;
  String? inserted;
  int? insertedBy;
  int? modified;
  int? modifiedBy;

  ReasonModel(
      {this.id,
        this.title,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy});

  ReasonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> ReasonModel = <String, dynamic>{};
    ReasonModel['id'] = id;
    ReasonModel['title'] = title;
    ReasonModel['status'] = status;
    ReasonModel['inserted'] = inserted;
    ReasonModel['inserted_by'] = insertedBy;
    ReasonModel['modified'] = modified;
    ReasonModel['modified_by'] = modifiedBy;
    return ReasonModel;
  }
}