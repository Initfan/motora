import 'package:motora/data/models/motor/motorcycle_api_model.dart';
import 'package:motora/data/service/motorcycle_api_service.dart';
import 'package:motora/domain/models/motor/motorcycle.dart';

class MotorcycleRepository {
  final MotorcycleApiService service;

  MotorcycleRepository(this.service);

  Future<List<Motorcycle>> getUserMotorcycles() async {
    final apiModels = await service.getUserMotorcycles();

    return apiModels.map((model) => model.toDomain()).toList();
  }
}
