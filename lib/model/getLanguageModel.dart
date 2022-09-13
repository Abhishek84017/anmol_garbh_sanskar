class GetLanguageDataModel {
  int? id;
  String? title;
  String? keyword;
  String? status;
  String? inserted;
  String? insertedBy;
  dynamic modified;
  dynamic modifiedBy;

  GetLanguageDataModel(
      {this.id,
        this.title,
        this.keyword,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy});

  GetLanguageDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    keyword = json['keyword'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['keyword'] = keyword;
    data['status'] = status;
    data['inserted'] = inserted;
    data['inserted_by'] = insertedBy;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    return data;
  }
}