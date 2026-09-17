import 'package:freezed_annotation/freezed_annotation.dart';

part 'motorcycle.freezed.dart';

@freezed
abstract class Motorcycle with _$Motorcycle {
  const factory Motorcycle({
    required int id,
    required String brand,
    required String model,
    required String year,
    required String transmission,
    required String policeNumber,
    required int kilometers,
    required int avgKilometersPerDay,
    required int userId,
    DateTime? lastServiceDate,
    String? motorUrl,
  }) = _Motorcycle;
}
