// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkSessionApiModel _$WorkSessionApiModelFromJson(Map<String, dynamic> json) =>
    _WorkSessionApiModel(
      id: (json['id'] as num).toInt(),
      motorcycleId: (json['motorcycle_id'] as num).toInt(),
      motorcycle: Motorcycle.fromJson(
        json['motorcycle'] as Map<String, dynamic>,
      ),
      platform: json['platform'] as String,
      kilometersStart: (json['kilometers_start'] as num).toInt(),
      goalProfit: (json['goal_profit'] as num).toInt(),
      fuelCondition: json['fuel_condition'] as String,
      kilometersFinish: (json['kilometers_finish'] as num?)?.toInt(),
      expense: (json['total_expense'] as num?)?.toInt() ?? 0,
      distance: (json['total_distance'] as num?)?.toInt() ?? 0,
      fuelExpense: (json['total_fuel'] as num?)?.toInt() ?? 0,
      income: (json['total_income'] as num?)?.toInt() ?? 0,
      order: (json['total_order'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? 'ACTIVE',
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      finishedAt: json['finished_at'] == null
          ? null
          : DateTime.parse(json['finished_at'] as String),
    );

Map<String, dynamic> _$WorkSessionApiModelToJson(
  _WorkSessionApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'motorcycle_id': instance.motorcycleId,
  'motorcycle': instance.motorcycle,
  'platform': instance.platform,
  'kilometers_start': instance.kilometersStart,
  'goal_profit': instance.goalProfit,
  'fuel_condition': instance.fuelCondition,
  'kilometers_finish': instance.kilometersFinish,
  'total_expense': instance.expense,
  'total_distance': instance.distance,
  'total_fuel': instance.fuelExpense,
  'total_income': instance.income,
  'total_order': instance.order,
  'status': instance.status,
  'started_at': instance.startedAt?.toIso8601String(),
  'finished_at': instance.finishedAt?.toIso8601String(),
};
