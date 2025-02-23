import 'package:todo/task/data/datasources/task_service.dart';
import 'package:todo/task/domain/models/task_model.dart';
import 'package:todo/task/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskService taskService;

  TaskRepositoryImpl(this.taskService);

  @override
  Future<List<TaskModel>> getTasks() async {
    return await taskService.getTasks();
  }

  @override
  Future<void> addTask(TaskModel task) async {
    await taskService.addTask(task);
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    await taskService.updateTask(task);
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    await taskService.deleteTask(task);
  }
}
