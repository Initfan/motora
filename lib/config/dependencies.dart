import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:motora/data/repositories/activity_repository.dart';
import 'package:motora/data/repositories/motorcycle_repository.dart';
import 'package:motora/data/repositories/work_session_repository.dart';
import 'package:motora/data/service/activity_api_service.dart';
import 'package:motora/data/service/motorcycle_api_service.dart';
import 'package:motora/data/service/work_session_api_service.dart';
import 'package:motora/ui/activity/view_models/activity_view_model.dart';
import 'package:motora/ui/motor/view_models/select_motor_view_model.dart';
import 'package:motora/ui/work/view_models/start_work_view_model.dart';
import 'package:motora/ui/work/view_models/work_session_view_model.dart';
import 'package:motora/utils/api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final api = ApiClient(baseUrl: dotenv.env['MOTORA_API']!);

final List<SingleChildWidget> dependencies = [
  Provider<MotorcycleApiService>(create: (_) => MotorcycleApiService(api)),
  Provider<MotorcycleRepository>(
    create: (context) =>
        MotorcycleRepository(context.read<MotorcycleApiService>()),
  ),
  ChangeNotifierProvider<SelectMotorViewModel>(
    create: (context) =>
        SelectMotorViewModel(repository: context.read<MotorcycleRepository>()),
  ),

  Provider<WorkSessionApiService>(create: (_) => WorkSessionApiService(api)),
  Provider<WorkSessionRepository>(
    create: (context) =>
        WorkSessionRepository(context.read<WorkSessionApiService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        WorkSessionViewModel(repository: context.read<WorkSessionRepository>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        StartWorkViewModel(repository: context.read<WorkSessionRepository>()),
  ),

  Provider<ActivityApiService>(create: (_) => ActivityApiService(api: api)),
  Provider<ActivityRepository>(
    create: (context) =>
        ActivityRepository(service: context.read<ActivityApiService>()),
  ),
  ChangeNotifierProvider<ActivityViewModel>(
    create: (context) =>
        ActivityViewModel(repository: context.read<ActivityRepository>()),
  ),
];
