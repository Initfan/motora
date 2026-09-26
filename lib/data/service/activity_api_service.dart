import 'package:motora/data/models/work/work_session_api_model.dart';
import 'package:motora/utils/api.dart';

class ActivityApiService {
  final ApiClient api;
  ActivityApiService({required this.api});

  Future<List<WorkSessionApiModel>?> getWorkActivities(
    DateTime fromDate,
    DateTime toDate,
  ) async {
    final response = await api.get(
      '/work/activity?from_date=$fromDate&to_date=$toDate',
    );

    final data = response['data'];

    if (data == null) {
      return [];
    }

    if (data is List) {
      return data
          .whereType<Map>()
          .map(
            (item) =>
                WorkSessionApiModel.fromJson(Map<String, dynamic>.from(item)),
          )
          .toList();
    }

    if (data is Map) {
      return data.values
          .whereType<Map>()
          .map(
            (item) =>
                WorkSessionApiModel.fromJson(Map<String, dynamic>.from(item)),
          )
          .toList();
    }

    throw const FormatException('Format data activity tidak valid');
  }
}
