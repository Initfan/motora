import 'package:motora/data/models/work/work_session_api_model.dart';
import 'package:motora/data/service/work_session_api_service.dart';
import 'package:motora/domain/models/work/work_session.dart';

class WorkSessionRepository {
  final WorkSessionApiService service;

  WorkSessionRepository(this.service);

  Future<WorkSession> getActiveSession() async {
    final apiModel = await service.getActiveSession();

    return apiModel.toDomain();
  }

  Future<bool> addIncome({
    required int sessionId,
    required int amount,
    required double km,
  }) async {
    await service.saveIncome(sessionId, amount, km);

    return true;
  }

  Future<WorkSession> startSession({
    required int motorcycleId,
    required int kilometersStart,
    required String platform,
    required int goalProfit,
    required String fuelCondition,
  }) async {
    final apiModel = await service.startSession(
      motorcycleId: motorcycleId,
      kilometersStart: kilometersStart,
      platform: platform,
      goalProfit: goalProfit,
      fuelCondition: fuelCondition,
    );

    return apiModel.toDomain();
  }
}
