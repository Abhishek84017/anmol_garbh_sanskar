
class PlanModel {
  int? id;
  String? title;
  String? description;
  String? days;
  String? price;
  String? numberOfSession;
  String? status;
  String? inserted;
  String? insertedBy;
  String? modified;
  String? modifiedBy;

  PlanModel(
      {this.id,
        this.title,
        this.description,
        this.days,
        this.price,
        this.numberOfSession,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy});

  PlanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    days = json['days'];
    price = json['price'];
    numberOfSession = json['number_of_session'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> PlanModel = <String, dynamic>{};
    PlanModel['id'] = id;
    PlanModel['title'] = title;
    PlanModel['description'] = description;
    PlanModel['days'] = days;
    PlanModel['price'] = price;
    PlanModel['number_of_session'] = numberOfSession;
    PlanModel['status'] = status;
    PlanModel['inserted'] = inserted;
    PlanModel['inserted_by'] = insertedBy;
    PlanModel['modified'] = modified;
    PlanModel['modified_by'] = modifiedBy;
    return PlanModel;
  }
}