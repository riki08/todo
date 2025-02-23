import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task/domain/models/task_model.dart';
import 'package:todo/task/presentation/cubit/task_cubit.dart';
import 'package:todo/utils/extension.dart';

class ItemTask extends StatefulWidget {
  const ItemTask({super.key, required this.task});

  final TaskModel task;

  @override
  State<ItemTask> createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.task.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        BlocProvider.of<TaskCubit>(context).deleteTask(widget.task);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: Text(widget.task.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.task.description),
            Text(
              'creado el ${widget.task.date.toString().formatDate()}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: Checkbox(
          value: widget.task.status,
          onChanged: (value) {
            final newTask = widget.task.copyWith(status: value);
            context.read<TaskCubit>().updateTask(newTask);
          },
        ),
      ),
    );
  }
}
