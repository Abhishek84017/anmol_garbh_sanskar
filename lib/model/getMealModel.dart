
class MealsModel {
  List<PreBreakfastSnacks>? preBreakfastSnacks;
  List<Breakfast>? breakfast;
  List<Snacks>? snacks;
  List<Lunch>? lunch;
  List<EveningSnacks>? eveningSnacks;
  List<Dinner>? dinner;

  MealsModel(
      {this.preBreakfastSnacks,
        this.breakfast,
        this.snacks,
        this.lunch,
        this.eveningSnacks,
        this.dinner});

  MealsModel.fromJson(Map<String, dynamic> json) {
    if (json['Pre - Breakfast Snacks'] != null) {
      preBreakfastSnacks = <PreBreakfastSnacks>[];
      json['Pre - Breakfast Snacks'].forEach((v) {
        preBreakfastSnacks!.add(new PreBreakfastSnacks.fromJson(v));
      });
    }
    if (json['Breakfast'] != null) {
      breakfast = <Breakfast>[];
      json['Breakfast'].forEach((v) {
        breakfast!.add(new Breakfast.fromJson(v));
      });
    }
    if (json['Snacks'] != null) {
      snacks = <Snacks>[];
      json['Snacks'].forEach((v) {
        snacks!.add(new Snacks.fromJson(v));
      });
    }
    if (json['Lunch'] != null) {
      lunch = <Lunch>[];
      json['Lunch'].forEach((v) {
        lunch!.add(new Lunch.fromJson(v));
      });
    }
    if (json['Evening Snacks'] != null) {
      eveningSnacks = <EveningSnacks>[];
      json['Evening Snacks'].forEach((v) {
        eveningSnacks!.add(new EveningSnacks.fromJson(v));
      });
    }
    if (json['Dinner'] != null) {
      dinner = <Dinner>[];
      json['Dinner'].forEach((v) {
        dinner!.add(new Dinner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.preBreakfastSnacks != null) {
      data['Pre - Breakfast Snacks'] =
          this.preBreakfastSnacks!.map((v) => v.toJson()).toList();
    }
    if (this.breakfast != null) {
      data['Breakfast'] = this.breakfast!.map((v) => v.toJson()).toList();
    }
    if (this.snacks != null) {
      data['Snacks'] = this.snacks!.map((v) => v.toJson()).toList();
    }
    if (this.lunch != null) {
      data['Lunch'] = this.lunch!.map((v) => v.toJson()).toList();
    }
    if (this.eveningSnacks != null) {
      data['Evening Snacks'] =
          this.eveningSnacks!.map((v) => v.toJson()).toList();
    }
    if (this.dinner != null) {
      data['Dinner'] = this.dinner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreBreakfastSnacks {
  int? id;
  String? description;
  String? mealCategoryId;
  String? day;
  String? status;
  String? inserted;
  String? insertedBy;
  dynamic modified;
  dynamic modifiedBy;
  dynamic code;

  PreBreakfastSnacks(
      {this.id,
        this.description,
        this.mealCategoryId,
        this.day,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.code});

  PreBreakfastSnacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    mealCategoryId = json['meal_category_id'];
    day = json['day'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['meal_category_id'] = this.mealCategoryId;
    data['day'] = this.day;
    data['status'] = this.status;
    data['inserted'] = this.inserted;
    data['inserted_by'] = this.insertedBy;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['code'] = this.code;
    return data;
  }
}
class Breakfast {
  int? id;
  String? description;
  String? mealCategoryId;
  String? day;
  String? status;
  String? inserted;
  String? insertedBy;
  Null? modified;
  Null? modifiedBy;
  String? code;

  Breakfast(
      {this.id,
        this.description,
        this.mealCategoryId,
        this.day,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.code});

  Breakfast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    mealCategoryId = json['meal_category_id'];
    day = json['day'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['meal_category_id'] = this.mealCategoryId;
    data['day'] = this.day;
    data['status'] = this.status;
    data['inserted'] = this.inserted;
    data['inserted_by'] = this.insertedBy;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['code'] = this.code;
    return data;
  }
}
class Snacks {
  int? id;
  String? description;
  String? mealCategoryId;
  String? day;
  String? status;
  String? inserted;
  String? insertedBy;
  Null? modified;
  Null? modifiedBy;
  String? code;

  Snacks(
      {this.id,
        this.description,
        this.mealCategoryId,
        this.day,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.code});

  Snacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    mealCategoryId = json['meal_category_id'];
    day = json['day'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['meal_category_id'] = this.mealCategoryId;
    data['day'] = this.day;
    data['status'] = this.status;
    data['inserted'] = this.inserted;
    data['inserted_by'] = this.insertedBy;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['code'] = this.code;
    return data;
  }
}
class Lunch {
  int? id;
  String? description;
  String? mealCategoryId;
  String? day;
  String? status;
  String? inserted;
  String? insertedBy;
  Null? modified;
  Null? modifiedBy;
  String? code;

  Lunch(
      {this.id,
        this.description,
        this.mealCategoryId,
        this.day,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.code});

  Lunch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    mealCategoryId = json['meal_category_id'];
    day = json['day'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['meal_category_id'] = this.mealCategoryId;
    data['day'] = this.day;
    data['status'] = this.status;
    data['inserted'] = this.inserted;
    data['inserted_by'] = this.insertedBy;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['code'] = this.code;
    return data;
  }
}
class EveningSnacks {
  int? id;
  String? description;
  String? mealCategoryId;
  String? day;
  String? status;
  String? inserted;
  String? insertedBy;
  Null? modified;
  Null? modifiedBy;
  String? code;

  EveningSnacks(
      {this.id,
        this.description,
        this.mealCategoryId,
        this.day,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.code});

  EveningSnacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    mealCategoryId = json['meal_category_id'];
    day = json['day'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['meal_category_id'] = this.mealCategoryId;
    data['day'] = this.day;
    data['status'] = this.status;
    data['inserted'] = this.inserted;
    data['inserted_by'] = this.insertedBy;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['code'] = this.code;
    return data;
  }
}
class Dinner {
  int? id;
  String? description;
  String? mealCategoryId;
  String? day;
  String? status;
  String? inserted;
  String? insertedBy;
  Null? modified;
  Null? modifiedBy;
  String? code;

  Dinner(
      {this.id,
        this.description,
        this.mealCategoryId,
        this.day,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.code});

  Dinner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    mealCategoryId = json['meal_category_id'];
    day = json['day'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['meal_category_id'] = this.mealCategoryId;
    data['day'] = this.day;
    data['status'] = this.status;
    data['inserted'] = this.inserted;
    data['inserted_by'] = this.insertedBy;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['code'] = this.code;
    return data;
  }
}