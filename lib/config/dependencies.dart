import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:motora/data/repositories/motorcycle_repository.dart';
import 'package:motora/data/service/motorcycle_api_service.dart';
import 'package:motora/ui/motor/view_models/select_motor_view_model.dart';
import 'package:motora/utils/api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> dependencies = [
  Provider<MotorcycleApiService>(
    create: (_) =>
        MotorcycleApiService(ApiClient(baseUrl: dotenv.env['MOTORA_API']!)),
  ),

  Provider<MotorcycleRepository>(
    create: (context) =>
        MotorcycleRepository(context.read<MotorcycleApiService>()),
  ),

  ChangeNotifierProvider<SelectMotorViewModel>(
    create: (context) =>
        SelectMotorViewModel(repository: context.read<MotorcycleRepository>()),
  ),
];
