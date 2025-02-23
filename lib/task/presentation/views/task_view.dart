import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task/domain/models/task_model.dart';
import 'package:todo/task/presentation/cubit/task_cubit.dart';
import 'package:todo/task/presentation/widgets/task_list.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: SafeArea(
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TaskLoaded) {
              return TaskList(tasks: state.tasks);
            } else if (state is TaskError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final titleController = TextEditingController();
              final descriptionController = TextEditingController();
              final formKey = GlobalKey<FormState>();

              return AlertDialog(
                title: const Text('Nueva Tarea'),
                content: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                          hintText: 'Ingrese el título de la tarea',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El título es obligatorio';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          labelText: 'Descripción',
                          hintText: 'Ingrese la descripción de la tarea',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La descripción es obligatoria';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final title = titleController.text;
                        final description = descriptionController.text;
                        context.read<TaskCubit>().addTask(
                              TaskModel(
                                title: title,
                                description: description,
                                status: false,
                                date: DateTime.now(),
                              ),
                            );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Crear'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
