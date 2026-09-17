// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkSessionApiModel _$WorkSessionApiModelFromJson(Map<String, dynamic> json) =>
    _WorkSessionApiModel(
      id: (json['id'] as num).toInt(),
      motorcycleId: (json['motorcycle_id'] as num).toInt(),
      platform: json['platform'] as String,
      kilometersStart: (json['kilometers_start'] as num).toInt(),
      goalProfit: (json['goal_profit'] as num).toInt(),
      fuelCondition: json['fuel_condition'] as String,
      kilometersFinish: (json['kilometers_finish'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toInt() ?? 0,
      income: (json['income'] as num?)?.toInt() ?? 0,
      totalOrder: (json['total_order'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? 'ACTIVE',
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      endedAt: json['ended_at'] == null
          ? null
          : DateTime.parse(json['ended_at'] as String),
    );

Map<String, dynamic> _$WorkSessionApiModelToJson(
  _WorkSessionApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'motorcycle_id': instance.motorcycleId,
  'platform': instance.platform,
  'kilometers_start': instance.kilometersStart,
  'goal_profit': instance.goalProfit,
  'fuel_condition': instance.fuelCondition,
  'kilometers_finish': instance.kilometersFinish,
  'distance': instance.distance,
  'income': instance.income,
  'total_order': instance.totalOrder,
  'status': instance.status,
  'started_at': instance.startedAt?.toIso8601String(),
  'ended_at': instance.endedAt?.toIso8601String(),
};
