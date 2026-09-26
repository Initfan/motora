import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motora/data/repositories/activity_repository.dart';
import 'package:motora/domain/models/activity/activity.dart';
import 'package:motora/domain/models/work/work_session.dart';
import 'package:motora/ui/work/view_models/start_work_view_model.dart';

part 'activity_view_model.freezed.dart';

@freezed
abstract class ActivityViewUiState with _$ActivityViewUiState {
  const factory ActivityViewUiState({
    @Default(['Semua', 'Selesai', 'Berjalan', 'Dibatalkan'])
    List<String> filters,
    WeekRange? selectedFilter,
    @Default(true) bool isLoading,
    List<Activity>? activities,
    @Default(0) int totalActivities,
    @Default(0) int totalIncome,
    @Default(0) int totalOrder,
    @Default(Duration.zero) Duration totalDuration,
    @Default(0) double totalDistance,
  }) = _ActivityViewUiState;
}

class ActivityViewModel extends ChangeNotifier {
  final ActivityRepository repository;

  ActivityViewModel({required this.repository})
    : _state = ActivityViewUiState();

  ActivityViewUiState _state = const ActivityViewUiState();

  ActivityViewUiState get state => _state;

  List<Activity>? get filteredActivities {
    if (state.activities == null) {
      return [];
    }

    if (state.selectedFilter == 'Semua') {
      return state.activities;
    }

    return state.activities!
        .where((item) => item.status == state.selectedFilter)
        .toList();
  }

  void selectFilter(WeekRange value) {
    _state = _state.copyWith(selectedFilter: value);
    notifyListeners();
    load(value.from);
  }

  String formatTime(DateTime date) => "${date.hour}:${date.minute}";

  String formatDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);
    return "${duration.inHours}j ${duration.inMinutes.toString().substring(0, 2)}m";
  }

  String formatDistance(int distance) => "$distance km";

  dynamic load(DateTime startDate) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final today = startDate;

      final to = DateTime(today.year, today.month, today.day);

      final from = to.subtract(const Duration(days: 6));

      final data = await repository.getWorkActivities(from, to);

      if (data is List && data!.isNotEmpty) {
        return _state = _state.copyWith(
          totalActivities: data.length,
          activities: data.whereType<WorkSession>().map((e) {
            final platform = platforms.firstWhere((p) => p.name == e.platform);
            return Activity(
              date: e.startedAt!,
              time: formatTime(e.finishedAt ?? DateTime.now()),
              platform: e.platform,
              status: e.status,
              orders: e.order,
              duration: e.finishedAt!.difference(e.startedAt!),
              income: e.income,
              distance: e.distance,
              icon: platform.icon,
              iconColor: platform.color,
              iconBackground: Color(0xFFE1F4E8),
            );
          }).toList(),
        );
      }

      _state = _state.copyWith(activities: []);
    } finally {
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  List<WeekRange> generateWeekRanges() {
    final today = DateTime.now();

    final todayDate = DateTime(today.year, today.month, today.day);

    final List<WeekRange> ranges = [];

    for (int i = 0; i < 4; i++) {
      final to = todayDate.subtract(Duration(days: i * 7));

      final from = to.subtract(const Duration(days: 6));

      ranges.add(
        WeekRange(
          id: '${from.toIso8601String()}_${to.toIso8601String()}',
          from: from,
          to: to,
          label: _formatRange(from, to),
        ),
      );
    }

    return ranges;
  }

  String _formatRange(DateTime from, DateTime to) {
    final today = DateTime.now();

    final isToday =
        to.year == today.year && to.month == today.month && to.day == today.day;

    final fromText = DateFormat('d MMM').format(from);

    if (isToday) {
      return '$fromText - Today';
    }

    final toText = DateFormat('d MMM').format(to);

    return '$fromText - $toText';
  }
}

class WeekRange {
  final String id;
  final DateTime from;
  final DateTime to;
  final String label;

  const WeekRange({
    required this.id,
    required this.from,
    required this.to,
    required this.label,
  });
}
