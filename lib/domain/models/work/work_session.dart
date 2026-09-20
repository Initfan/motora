import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motora/domain/models/motor/motorcycle.dart';

part 'work_session.freezed.dart';
part 'work_session.g.dart';

@freezed
abstract class WorkSession with _$WorkSession {
  const factory WorkSession({
    required int id,
    required int motorcycleId,
    required String platform,
    required int kilometersStart,
    required int goalProfit,
    required String fuelCondition,
    int? kilometersFinish,
    @Default("ACTIVE") String status,
    @Default(0) int fuelExpense,
    @Default(0) int expense,
    @Default(0) int distance,
    @Default(0) int income,
    @Default(0) int order,
    required Motorcycle motorcycle,
    DateTime? startedAt,
    DateTime? finishedAt,
  }) = _WorkSession;

  factory WorkSession.fromJson(Map<String, dynamic> json) =>
      _$WorkSessionFromJson(json);
}
