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

  Future<void> addTask(TaskModel task) async {
    try {
      // TODO : se podria agregar una variable en el cubit que tengas el listado de tareas y agrega, eliminar o actualizar si cada llamado es correcto
      emit(TaskLoading());
      await taskRepository.addTask(task);
      getTasks();
    } catch (e) {
      emit(TaskError("Error al agregar la tarea"));
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      // TODO : se podria agregar una variable en el cubit que tengas el listado de tareas y agrega, eliminar o actualizar si cada llamado es correcto
      emit(TaskLoading());
      await taskRepository.updateTask(task);
      getTasks();
    } catch (e) {
      emit(TaskError("Error al actualizar la tarea"));
    }
  }

  Future<void> deleteTask(TaskModel task) async {
    try {
      // TODO : se podria agregar una variable en el cubit que tengas el listado de tareas y agrega, eliminar o actualizar si cada llamado es correcto
      emit(TaskLoading());
      await taskRepository.deleteTask(task);
      getTasks();
    } catch (e) {
      emit(TaskError("Error al eliminar la tarea"));
    }
  }
}
