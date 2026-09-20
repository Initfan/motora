import 'package:freezed_annotation/freezed_annotation.dart';

part 'motorcycle.freezed.dart';
part 'motorcycle.g.dart';

@freezed
abstract class Motorcycle with _$Motorcycle {
  const factory Motorcycle({
    required int id,
    required String brand,
    required String model,
    required String year,
    required String transmission,
    @JsonKey(name: 'police_number') required String policeNumber,
    required int kilometers,
    @JsonKey(name: 'avg_kilometers_per_day') required int avgKilometersPerDay,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'last_service_date') DateTime? lastServiceDate,
    String? status,
    @JsonKey(name: 'motor_url') String? motorUrl,
  }) = _Motorcycle;

  factory Motorcycle.fromJson(Map<String, dynamic> json) =>
      _$MotorcycleFromJson(json);
}
