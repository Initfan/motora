import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:motora/data/repositories/motorcycle_repository.dart';
import 'package:motora/domain/models/motor/motorcycle.dart';
import 'package:motora/utils/error.dart';

part 'select_motor_view_model.freezed.dart';

@freezed
abstract class SelectMotorUiState with _$SelectMotorUiState {
  const factory SelectMotorUiState({
    @Default(false) bool isLoading,
    @Default(false) bool isSelecting,
    @Default([]) List<Motorcycle> motorcycles,
    Motorcycle? selectedMotorcycle,
    String? errorMessage,
  }) = _SelectMotorUiState;
}

class SelectMotorViewModel extends ChangeNotifier {
  final MotorcycleRepository repository;

  SelectMotorViewModel({required this.repository});

  SelectMotorUiState _state = const SelectMotorUiState();

  SelectMotorUiState get state => _state;

  Future<void> loadMotorcycles() async {
    _state = _state.copyWith(isLoading: true, errorMessage: null);

    notifyListeners();

    try {
      final motorcycles = await repository.getUserMotorcycles();

      _state = _state.copyWith(
        isLoading: false,
        motorcycles: motorcycles,
        selectedMotorcycle: state.selectedMotorcycle ?? motorcycles.first,
      );
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        errorMessage: getErrorMessage(e),
      );
    }

    notifyListeners();
  }

  void selectMotorcycle(Motorcycle motorcycle) {
    _state = _state.copyWith(selectedMotorcycle: motorcycle);

    notifyListeners();
  }

  Future<bool> useSelectedMotorcycle() async {
    if (_state.selectedMotorcycle == null) {
      return false;
    }

    _state = _state.copyWith(isSelecting: true);

    notifyListeners();
    return true;
  }
}
