import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motora/data/repositories/work_session_repository.dart';
import 'package:motora/domain/models/work/work_session.dart';
import 'package:motora/utils/error.dart';

part 'work_session_view_model.freezed.dart';

@freezed
abstract class WorkSessionUiState with _$WorkSessionUiState {
  const factory WorkSessionUiState({
    @Default(false) bool isLoading,
    String? errorMessage,
    WorkSession? workSession,
    @Default(0) int currentIncome,
  }) = _WorkSessionUiState;
}

class WorkSessionViewModel extends ChangeNotifier {
  final WorkSessionRepository repository;

  WorkSessionViewModel({required this.repository});

  WorkSessionUiState _state = const WorkSessionUiState();

  WorkSessionUiState get state => _state;

  Future<void> load() async {
    _state = _state.copyWith(isLoading: true, errorMessage: null);

    notifyListeners();

    try {
      final workSession = await repository.getActiveSession();

      _state = _state.copyWith(isLoading: false, workSession: workSession);
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        errorMessage: getErrorMessage(e),
      );
    }

    notifyListeners();
  }
}
