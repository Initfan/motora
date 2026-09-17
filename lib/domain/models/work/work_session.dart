import 'package:freezed_annotation/freezed_annotation.dart';

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

    @Default(0) int distance,

    @Default(0) int income,

    @Default(0) int totalOrder,

    DateTime? startedAt,
    DateTime? endedAt,
  }) = _WorkSession;

  factory WorkSession.fromJson(Map<String, dynamic> json) =>
      _$WorkSessionFromJson(json);
}
