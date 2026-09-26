import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motora/data/repositories/work_session_repository.dart';
import 'package:motora/domain/models/motor/motorcycle.dart';
import 'package:motora/domain/models/work/work_session.dart';

part 'start_work_view_model.freezed.dart';

class PlatformData {
  final String name;
  final String subtitle;
  final IconData icon;
  final Color color;

  const PlatformData({
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

const platforms = [
  PlatformData(
    name: 'Grab',
    subtitle: 'Transport & delivery',
    icon: Icons.two_wheeler_rounded,
    color: Color(0xFF08A94F),
  ),
  PlatformData(
    name: 'ShopeeFood',
    subtitle: 'Delivery makanan',
    icon: Icons.shopping_bag_rounded,
    color: Color(0xFFEE4D2D),
  ),
  PlatformData(
    name: 'Gojek',
    subtitle: 'Transport & delivery',
    icon: Icons.two_wheeler_rounded,
    color: Color(0xFF00AA13),
  ),
  PlatformData(
    name: 'Lalamove',
    subtitle: 'Transport & delivery',
    icon: Icons.local_shipping_rounded,
    color: Color(0xFFFF6B00),
  ),
  PlatformData(
    name: 'Indrive',
    subtitle: 'Transport',
    icon: Icons.two_wheeler_rounded,
    color: Color(0xFFa1e12d),
  ),
  PlatformData(
    name: 'Maxim',
    subtitle: 'Transport',
    icon: Icons.two_wheeler_rounded,
    color: Color(0xfff7c500),
  ),
];

@freezed
abstract class StartWorkUiState with _$StartWorkUiState {
  const factory StartWorkUiState({
    @Default(
      PlatformData(
        name: 'Grab',
        subtitle: 'Transport & delivery',
        icon: Icons.two_wheeler_rounded,
        color: Color(0xFF08A94F),
      ),
    )
    PlatformData selectedPlatform,

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

  void setPlatform(PlatformData platform) {
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

  Future<WorkSession?> startSession(Motorcycle motorcycle) async {
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
        platform: _state.selectedPlatform.name,
        goalProfit: _state.targetProfit,
        fuelCondition: '${_state.fuelLevel.ceil()}%',
      );

      _state = _state.copyWith(isStarting: false, workSession: session);

      notifyListeners();

      return session;
    } catch (e) {
      print(e);
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
