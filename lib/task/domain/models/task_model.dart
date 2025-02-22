class TaskModel {
  final String title;
  final String description;
  final bool status;
  final DateTime date;

  TaskModel({
    required this.title,
    required this.description,
    required this.status,
    required this.date,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    bool? status,
    DateTime? date,
  }) =>
      TaskModel(
        title: title ?? this.title,
        description: description ?? this.description,
        status: status ?? this.status,
        date: date ?? this.date,
      );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json["title"],
        description: json["description"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "status": status,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
