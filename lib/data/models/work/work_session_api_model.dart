import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motora/domain/models/work/work_session.dart';

part 'work_session_api_model.freezed.dart';
part 'work_session_api_model.g.dart';

@freezed
abstract class WorkSessionApiModel with _$WorkSessionApiModel {
  const factory WorkSessionApiModel({
    required int id,

    @JsonKey(name: 'motorcycle_id') required int motorcycleId,

    required String platform,

    @JsonKey(name: 'kilometers_start') required int kilometersStart,

    @JsonKey(name: 'goal_profit') required int goalProfit,

    @JsonKey(name: 'fuel_condition') required String fuelCondition,

    @JsonKey(name: 'kilometers_finish') int? kilometersFinish,

    @Default(0) int distance,

    @Default(0) int income,

    @JsonKey(name: 'total_order') @Default(0) int totalOrder,

    @JsonKey(name: 'status') @Default('ACTIVE') String status,

    @JsonKey(name: 'started_at') DateTime? startedAt,

    @JsonKey(name: 'ended_at') DateTime? endedAt,
  }) = _WorkSessionApiModel;

  factory WorkSessionApiModel.fromJson(Map<String, dynamic> json) =>
      _$WorkSessionApiModelFromJson(json);
}

extension WorkSessionApiModelMapper on WorkSessionApiModel {
  WorkSession toDomain() {
    return WorkSession(
      id: id,
      motorcycleId: motorcycleId,
      platform: platform,
      kilometersStart: kilometersStart,
      kilometersFinish: kilometersFinish,
      goalProfit: goalProfit,
      fuelCondition: fuelCondition,
      distance: distance,
      income: income,
      totalOrder: totalOrder,
      startedAt: startedAt,
      endedAt: endedAt,
    );
  }
}
