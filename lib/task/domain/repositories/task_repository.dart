import 'package:todo/task/domain/models/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTasks();
}
