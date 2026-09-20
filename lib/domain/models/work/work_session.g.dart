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
  fuelExpense: (json['fuelExpense'] as num?)?.toInt() ?? 0,
  expense: (json['expense'] as num?)?.toInt() ?? 0,
  distance: (json['distance'] as num?)?.toInt() ?? 0,
  income: (json['income'] as num?)?.toInt() ?? 0,
  order: (json['order'] as num?)?.toInt() ?? 0,
  motorcycle: Motorcycle.fromJson(json['motorcycle'] as Map<String, dynamic>),
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
  finishedAt: json['finishedAt'] == null
      ? null
      : DateTime.parse(json['finishedAt'] as String),
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
      'fuelExpense': instance.fuelExpense,
      'expense': instance.expense,
      'distance': instance.distance,
      'income': instance.income,
      'order': instance.order,
      'motorcycle': instance.motorcycle,
      'startedAt': instance.startedAt?.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
    };
