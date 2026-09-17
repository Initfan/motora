import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motora/domain/models/motor/motorcycle.dart';

part 'motorcycle_api_model.freezed.dart';
part 'motorcycle_api_model.g.dart';

@freezed
abstract class MotorcycleApiModel with _$MotorcycleApiModel {
  const factory MotorcycleApiModel({
    required int id,
    required String brand,
    required String model,
    required String year,
    required String transmission,

    @JsonKey(name: 'police_number') required String policeNumber,

    required int kilometers,

    @JsonKey(name: 'avg_kilometers_per_day')
    @Default(0)
    int avgKilometersPerDay,

    @JsonKey(name: 'last_service_date') DateTime? lastServiceDate,

    @JsonKey(name: 'user_id') required int userId,

    @JsonKey(name: 'motor_url') String? motorUrl,
  }) = _MotorcycleApiModel;

  factory MotorcycleApiModel.fromJson(Map<String, dynamic> json) =>
      _$MotorcycleApiModelFromJson(json);
}

extension MotorcycleApiModelMapper on MotorcycleApiModel {
  Motorcycle toDomain() {
    return Motorcycle(
      id: id,
      brand: brand,
      model: model,
      year: year,
      transmission: transmission,
      policeNumber: policeNumber,
      kilometers: kilometers,
      avgKilometersPerDay: avgKilometersPerDay,
      lastServiceDate: lastServiceDate,
      userId: userId,
      motorUrl: motorUrl,
    );
  }
}
