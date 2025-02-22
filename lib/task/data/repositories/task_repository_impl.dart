import 'package:todo/task/data/datasources/task_service.dart';
import 'package:todo/task/domain/models/task_model.dart';
import 'package:todo/task/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskService taskService;

  TaskRepositoryImpl(this.taskService);

  Future<List<TaskModel>> getTasks() async {
    return await taskService.getTasks();
  }
}
