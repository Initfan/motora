import 'package:motora/data/models/motor/motorcycle_api_model.dart';
import 'package:motora/utils/api.dart';

class MotorcycleApiService {
  final ApiClient api;

  MotorcycleApiService(this.api);

  Future<List<MotorcycleApiModel>> getUserMotorcycles() async {
    final response = await api.get('/motorcycle/user');

    final data = response['data'];

    if (data == null) {
      return [];
    }

    if (data is List) {
      return data
          .whereType<Map>()
          .map(
            (item) =>
                MotorcycleApiModel.fromJson(Map<String, dynamic>.from(item)),
          )
          .toList();
    }

    if (data is Map) {
      return data.values
          .whereType<Map>()
          .map(
            (item) =>
                MotorcycleApiModel.fromJson(Map<String, dynamic>.from(item)),
          )
          .toList();
    }

    throw const FormatException('Format data motor tidak valid');
  }
}
