import 'package:get_it/get_it.dart';
import 'package:todo/task/data/datasources/task_service.dart';
import 'package:todo/task/data/repositories/task_repository_impl.dart';
import 'package:todo/task/domain/repositories/task_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<TaskService>(
    TaskService(),
  );

  locator.registerSingleton<TaskRepository>(
    TaskRepositoryImpl(locator<TaskService>()),
  );
}
