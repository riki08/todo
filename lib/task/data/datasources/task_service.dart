import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/task/domain/models/task_model.dart';

class TaskService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<TaskModel>> getTasks() async {
    final tasks = await firestore.collection('tasks').get();
    return tasks.docs.map((doc) => TaskModel.fromDocument(doc)).toList();
  }

  Future<void> addTask(TaskModel task) async {
    final docRef = FirebaseFirestore.instance.collection('tasks').doc();
    final newTask = task.copyWith(id: docRef.id);

    await docRef.set(newTask.toJson());
  }

  Future<void> updateTask(TaskModel task) async {
    await firestore.collection('tasks').doc(task.id).update(task.toJson());
  }

  Future<void> deleteTask(TaskModel task) async {
    await firestore.collection('tasks').doc(task.id).delete();
  }
}
