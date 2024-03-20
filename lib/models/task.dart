class Task {
  String? taskId;
  String? taskTitle;
  String? taskDescription;
  DateTime? taskStartDate;
  DateTime? taskEndDate;
  bool completed;

  Task(
      {this.taskId,
      this.taskTitle,
      this.taskDescription,
      this.taskStartDate,
      this.taskEndDate,
      this.completed = false});
}
