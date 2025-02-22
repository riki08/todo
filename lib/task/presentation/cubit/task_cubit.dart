import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task/domain/models/task_model.dart';
import 'package:todo/task/domain/repositories/task_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;

  TaskCubit(this.taskRepository) : super(TaskInitial());

  Future<void> getTasks() async {
    try {
      emit(TaskLoading());
      final tasks = await taskRepository.getTasks();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError("Error al cargar las tareas"));
    }
  }
}
