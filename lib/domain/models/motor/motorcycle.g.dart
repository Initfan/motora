// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motorcycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Motorcycle _$MotorcycleFromJson(Map<String, dynamic> json) => _Motorcycle(
  id: (json['id'] as num).toInt(),
  brand: json['brand'] as String,
  model: json['model'] as String,
  year: json['year'] as String,
  transmission: json['transmission'] as String,
  policeNumber: json['police_number'] as String,
  kilometers: (json['kilometers'] as num).toInt(),
  avgKilometersPerDay: (json['avg_kilometers_per_day'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  lastServiceDate: json['last_service_date'] == null
      ? null
      : DateTime.parse(json['last_service_date'] as String),
  status: json['status'] as String?,
  motorUrl: json['motor_url'] as String?,
);

Map<String, dynamic> _$MotorcycleToJson(_Motorcycle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'transmission': instance.transmission,
      'police_number': instance.policeNumber,
      'kilometers': instance.kilometers,
      'avg_kilometers_per_day': instance.avgKilometersPerDay,
      'user_id': instance.userId,
      'last_service_date': instance.lastServiceDate?.toIso8601String(),
      'status': instance.status,
      'motor_url': instance.motorUrl,
    };
