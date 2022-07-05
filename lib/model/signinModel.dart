class SignInModel {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? username;
  String? password;
  String? joinReasonId;
  String? token;
  String? memberType;
  String? exiprePlanDate;
  String? status;
  String? inserted;
  String? insertedBy;
  String? modified;
  String? modifiedBy;
  String? lastMenstrualDate;
  String? isPlanActive;
  String? lastModifiedChats;

  SignInModel(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.username,
        this.password,
        this.joinReasonId,
        this.token,
        this.memberType,
        this.exiprePlanDate,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.lastMenstrualDate,
        this.isPlanActive,
        this.lastModifiedChats});

  SignInModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    username = json['username'];
    password = json['password'];
    joinReasonId = json['join_reason_id'];
    token = json['token'];
    memberType = json['member_type'];
    exiprePlanDate = json['exipre_plan_date'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    lastMenstrualDate = json['last_menstrual_date'];
    isPlanActive = json['is_plan_active'];
    lastModifiedChats = json['last_modified_chats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['username'] = this.username;
    data['password'] = this.password;
    data['join_reason_id'] = this.joinReasonId;
    data['token'] = this.token;
    data['member_type'] = this.memberType;
    data['exipre_plan_date'] = this.exiprePlanDate;
    data['status'] = this.status;
    data['inserted'] = this.inserted;
    data['inserted_by'] = this.insertedBy;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['last_menstrual_date'] = this.lastMenstrualDate;
    data['is_plan_active'] = this.isPlanActive;
    data['last_modified_chats'] = this.lastModifiedChats;
    return data;
  }
}