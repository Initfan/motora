import 'package:motora/data/models/work/work_session_api_model.dart';
import 'package:motora/utils/api.dart';

class WorkSessionApiService {
  final ApiClient api;

  WorkSessionApiService(this.api);

  Future<WorkSessionApiModel> getActiveSession() async {
    final response = await api.get('/work');

    final data = response['data'];

    if (data is! Map) {
      throw const FormatException('Response work session tidak valid');
    }

    return WorkSessionApiModel.fromJson(Map<String, dynamic>.from(data));
  }

  Future<WorkSessionApiModel> startSession({
    required int motorcycleId,
    required int kilometersStart,
    required String platform,
    required int goalProfit,
    required String fuelCondition,
  }) async {
    final response = await api.post(
      '/work/start',
      body: {
        'motorcycle_id': motorcycleId,
        'kilometers_start': kilometersStart,
        'platform': platform,
        'goal_profit': goalProfit,
        'fuel_condition': fuelCondition,
      },
    );

    final data = response['session'];

    if (data is! Map) {
      throw const FormatException('Response work session tidak valid');
    }

    return WorkSessionApiModel.fromJson(Map<String, dynamic>.from(data));
  }

  Future<bool> saveIncome(
    int sessionId,
    int amount,
    double km,
    int order,
  ) async {
    final res = await api.post(
      '/work/income',
      body: {
        "work_session_id": sessionId,
        "income_type": "ORDER",
        "order": order,
        "amount": amount,
        "distance": km,
      },
    );

    final data = res['income'];

    if (data is! Map) {
      throw const FormatException('Response save income tidak valid');
    }

    return true;
  }
}
