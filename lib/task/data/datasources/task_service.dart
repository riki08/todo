import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/task/domain/models/task_model.dart';

class TaskService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<TaskModel>> getTasks() async {
    final tasks = await firestore.collection('tasks').get();
    return tasks.docs.map((e) => TaskModel.fromJson(e.data())).toList();
  }
}
