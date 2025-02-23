import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? id;
  final String title;
  final String description;
  final bool status;
  final DateTime date;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.date,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? status,
    DateTime? date,
  }) =>
      TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        status: status ?? this.status,
        date: date ?? this.date,
      );

  factory TaskModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TaskModel(
      id: doc.id, // Usamos el ID del documento
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      status: data['status'] ?? false,
      date: DateTime.parse(data['date'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
