// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkSession _$WorkSessionFromJson(Map<String, dynamic> json) => _WorkSession(
  id: (json['id'] as num).toInt(),
  motorcycleId: (json['motorcycleId'] as num).toInt(),
  platform: json['platform'] as String,
  kilometersStart: (json['kilometersStart'] as num).toInt(),
  goalProfit: (json['goalProfit'] as num).toInt(),
  fuelCondition: json['fuelCondition'] as String,
  kilometersFinish: (json['kilometersFinish'] as num?)?.toInt(),
  status: json['status'] as String? ?? "ACTIVE",
  distance: (json['distance'] as num?)?.toInt() ?? 0,
  income: (json['income'] as num?)?.toInt() ?? 0,
  totalOrder: (json['totalOrder'] as num?)?.toInt() ?? 0,
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
);

Map<String, dynamic> _$WorkSessionToJson(_WorkSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'motorcycleId': instance.motorcycleId,
      'platform': instance.platform,
      'kilometersStart': instance.kilometersStart,
      'goalProfit': instance.goalProfit,
      'fuelCondition': instance.fuelCondition,
      'kilometersFinish': instance.kilometersFinish,
      'status': instance.status,
      'distance': instance.distance,
      'income': instance.income,
      'totalOrder': instance.totalOrder,
      'startedAt': instance.startedAt?.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
    };
