class Task {
  String taskId;
  String? taskTitle;
  String? taskDescription;
  DateTime? taskStartDate;
  DateTime? taskEndDate;
  bool completed;

  Task(
      {required this.taskId,
      this.taskTitle,
      this.taskDescription,
      this.taskStartDate,
      this.taskEndDate,
      this.completed = false});


  Task copyWith({
    String? taskId,
    String? taskTitle,
    String? taskDescription,
    DateTime? taskStartDate,
    DateTime? taskEndDate,
    bool? completed,
  }) {
    return Task(
      taskId: taskId ?? this.taskId,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDescription: taskDescription ?? this.taskDescription,
      taskStartDate: taskStartDate ?? this.taskStartDate,
      taskEndDate: taskEndDate ?? this.taskEndDate,
      completed: completed ?? this.completed,
    );
  }
}
