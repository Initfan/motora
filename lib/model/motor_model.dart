class MotorModel {
  int? id;
  String? brand;
  String? motorUrl;
  String? model;
  String? year;
  String? transmission;
  String? policeNumber;
  int? kilometers;
  int? avgKilometersPerDay;
  String? lastServiceDate;
  String? status;
  int? userId;

  MotorModel({
    this.id,
    this.brand,
    this.motorUrl,
    this.model,
    this.year,
    this.transmission,
    this.policeNumber,
    this.kilometers,
    this.avgKilometersPerDay,
    this.lastServiceDate,
    this.status,
    this.userId,
  });

  MotorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    motorUrl = json['motor_url'];
    model = json['model'];
    year = json['year'];
    transmission = json['transmission'];
    policeNumber = json['police_number'];
    kilometers = json['kilometers'];
    avgKilometersPerDay = json['avg_kilometers_per_day'];
    lastServiceDate = json['last_service_date'];
    status = json['status'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['motor_url'] = this.motorUrl;
    data['model'] = this.model;
    data['year'] = this.year;
    data['transmission'] = this.transmission;
    data['police_number'] = this.policeNumber;
    data['kilometers'] = this.kilometers;
    data['avg_kilometers_per_day'] = this.avgKilometersPerDay;
    data['last_service_date'] = this.lastServiceDate;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    return data;
  }
}
