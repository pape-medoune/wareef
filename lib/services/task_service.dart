import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wareef/models/task.dart';

class TaskService with ChangeNotifier {
  List<Task> tasks = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addTask(Task task) async {
    await firestore.collection("tasks").add({
      'title': task.taskTitle,
      'description': task.taskDescription,
      'start_date': task.taskStartDate,
      'end_date': task.taskEndDate,
    }).then((value) {
      task.taskId = value.id;
      tasks.add(task);
    });
    notifyListeners();
  }

  updateTask(Task task) async {
    var index = tasks.indexWhere((element) => element.taskId == task.taskId);
    if (index != -1) {
      await firestore.collection('tasks').doc(task.taskId).update({
        'title': task.taskTitle,
        'description': task.taskDescription,
        'start_date': task.taskStartDate,
        'end_date': task.taskEndDate
      });
      tasks[index] = task;
    }
    notifyListeners();
  }

  removeTask(id) async {
    var index = tasks.indexWhere((element) => element.taskId == id.taskId);
    if (index != -1) {
      await firestore.collection('tasks').doc(id).delete();
      tasks.removeAt(index);
    }
    notifyListeners();
  }
}
