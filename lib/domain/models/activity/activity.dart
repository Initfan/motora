import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';

@freezed
abstract class Activity with _$Activity {
  const factory Activity({
    required DateTime date,
    required String time,
    required String platform,
    required String status,
    required int orders,
    required Duration duration,
    required int income,
    required int distance,
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
  }) = _Activity;

  // factory Activity.fromJson(Map<String, dynamic> json) =>
  //     _$ActivityFromJson(json);
}
