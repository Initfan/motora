import 'package:motora/data/models/work/work_session_api_model.dart';
import 'package:motora/data/service/activity_api_service.dart';
import 'package:motora/domain/models/work/work_session.dart';

class ActivityRepository {
  final ActivityApiService service;

  const ActivityRepository({required this.service});

  Future<List<WorkSession>?> getWorkActivities(
    DateTime fromDate,
    DateTime toDate,
  ) async {
    final apiModels = await service.getWorkActivities(fromDate, toDate);

    if (apiModels == null) {
      return [];
    }

    return apiModels.map((model) => model.toDomain()).toList();
  }
}
