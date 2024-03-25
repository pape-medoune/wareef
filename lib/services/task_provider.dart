import 'package:flutter/material.dart';
import 'package:wareef/models/task.dart'; // Importer le modèle Task

import 'task_service.dart'; // Importer le service Task

class TaskModel with ChangeNotifier {
  final TaskService _taskService = TaskService();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskModel() {
    _tasks = _taskService.getTasks() as List<Task>;
  }

  void addTask(Task task) {
    _taskService.addTask(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    _taskService.updateTask(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _taskService.deleteTask(id);
    notifyListeners();
  }
}
