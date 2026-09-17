import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motora/data/repositories/work_session_repository.dart';
import 'package:motora/domain/models/motor/motorcycle.dart';
import 'package:motora/domain/models/work/work_session.dart';

part 'start_work_view_model.freezed.dart';

@freezed
abstract class StartWorkUiState with _$StartWorkUiState {
  const factory StartWorkUiState({
    @Default('GrabFood') String selectedPlatform,

    @Default(0) double fuelLevel,

    @Default(0) int targetProfit,

    @Default(false) bool isStarting,

    Motorcycle? motorcycle,

    WorkSession? workSession,

    String? errorMessage,
  }) = _StartWorkUiState;
}

class StartWorkViewModel extends ChangeNotifier {
  final WorkSessionRepository repository;

  StartWorkViewModel({required this.repository, Motorcycle? motorcycle})
    : _state = StartWorkUiState(motorcycle: motorcycle);

  StartWorkUiState _state = const StartWorkUiState();

  StartWorkUiState get state => _state;

  void setPlatform(String platform) {
    _state = _state.copyWith(selectedPlatform: platform);

    notifyListeners();
  }

  void setFuelLevel(double level) {
    _state = _state.copyWith(fuelLevel: level);

    notifyListeners();
  }

  void setTargetProfit(int profit) {
    _state = _state.copyWith(targetProfit: profit);

    notifyListeners();
  }

  Future<WorkSession?> startSession() async {
    final motorcycle = _state.motorcycle;

    if (motorcycle == null) {
      _setError('Motor belum dipilih.');
      return null;
    }

    if (_state.targetProfit <= 0) {
      _setError('Masukkan target profit terlebih dahulu.');
      return null;
    }

    _state = _state.copyWith(isStarting: true, errorMessage: null);

    notifyListeners();

    try {
      final session = await repository.startSession(
        motorcycleId: motorcycle.id,
        kilometersStart: motorcycle.kilometers,
        platform: _state.selectedPlatform,
        goalProfit: _state.targetProfit,
        fuelCondition: '${_state.fuelLevel.ceil()}%',
      );

      _state = _state.copyWith(isStarting: false, workSession: session);

      notifyListeners();

      return session;
    } catch (e) {
      _state = _state.copyWith(
        isStarting: false,
        errorMessage: _getErrorMessage(e),
      );

      notifyListeners();

      return null;
    }
  }

  void clearError() {
    _state = _state.copyWith(errorMessage: null);

    notifyListeners();
  }

  void _setError(String message) {
    _state = _state.copyWith(errorMessage: message);

    notifyListeners();
  }

  String _getErrorMessage(Object error) {
    final message = error.toString();

    if (message.contains('SocketException')) {
      return 'Tidak dapat terhubung ke server.';
    }

    if (message.contains('401')) {
      return 'Sesi login kamu telah berakhir.';
    }

    return 'Gagal memulai sesi.';
  }
}
