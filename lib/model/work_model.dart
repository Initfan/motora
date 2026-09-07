class WorkModel {
  int? id;
  int? kilometersStart;
  int? kilometersFinish;
  String? platform;
  int? goalProfit;
  String? fuelCondition;
  int? totalOrder;
  String? status;
  String? startedAt;
  DateTime? finishedAt;
  String? createdAt;
  int? userId;
  int? motorcycleId;

  WorkModel({
    this.id,
    this.kilometersStart,
    this.kilometersFinish,
    this.platform,
    this.goalProfit,
    this.fuelCondition,
    this.totalOrder,
    this.status,
    this.startedAt,
    this.finishedAt,
    this.createdAt,
    this.userId,
    this.motorcycleId,
  });

  WorkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kilometersStart = json['kilometers_start'];
    kilometersFinish = json['kilometers_finish'];
    platform = json['platform'];
    goalProfit = json['goal_profit'];
    fuelCondition = json['fuel_condition'];
    totalOrder = json['total_order'];
    status = json['status'];
    startedAt = json['started_at'];
    finishedAt = json['finished_at'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    motorcycleId = json['motorcycle_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kilometers_start'] = this.kilometersStart;
    data['kilometers_finish'] = this.kilometersFinish;
    data['platform'] = this.platform;
    data['goal_profit'] = this.goalProfit;
    data['fuel_condition'] = this.fuelCondition;
    data['total_order'] = this.totalOrder;
    data['status'] = this.status;
    data['started_at'] = this.startedAt;
    data['finished_at'] = this.finishedAt;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['motorcycle_id'] = this.motorcycleId;
    return data;
  }
}
