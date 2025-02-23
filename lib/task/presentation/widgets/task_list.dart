import 'package:flutter/material.dart';
import 'package:todo/task/domain/models/task_model.dart';
import 'package:todo/task/presentation/widgets/item_task.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return tasks.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ItemTask(task: task);
              },
            ),
          )
        : Center(child: Text('No hay tareas'));
  }
}
