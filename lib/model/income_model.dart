class IncomeModel {
  int? id;
  String? incomeType;
  int? amount;
  double? distance;
  String? description;
  String? createdAt;
  int? workSessionId;

  IncomeModel({
    this.id,
    this.incomeType,
    this.amount,
    this.distance,
    this.description,
    this.createdAt,
    this.workSessionId,
  });

  IncomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    incomeType = json['income_type'];
    amount = json['amount'];
    distance = (json['distance'] as num?)?.toDouble();
    description = json['description'];
    createdAt = json['created_at'];
    workSessionId = json['work_session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['income_type'] = this.incomeType;
    data['amount'] = this.amount;
    data['distance'] = this.distance;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['work_session_id'] = this.workSessionId;
    return data;
  }
}
