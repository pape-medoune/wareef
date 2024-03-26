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
      'completed':task.completed,
    }).then((value) {
      task.taskId = value.id;
      tasks.add(task);
    });
    notifyListeners();
  }

  Future<Task> getTaskDetails(String id) async {
    DocumentSnapshot documentSnapshot = await firestore.collection('tasks').doc(id).get();
    if (documentSnapshot.exists) {
      return Task(
        taskId: documentSnapshot.id,
        taskTitle: documentSnapshot['title'],
        taskDescription: documentSnapshot['description'],
        taskStartDate: DateTime.parse(documentSnapshot['start_date']),
        taskEndDate: DateTime.parse(documentSnapshot['end_date']),
      );
    } else {
      throw Exception('Task not found');
    }
  }



  Stream<List<Task>> getTasks() {
    return firestore
        .collection('tasks')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Task(
                  taskId: doc.id,
                  taskTitle: doc['title'],
                  taskDescription: doc['description'],
                  taskStartDate: DateTime.parse(doc['start_date']),
                  taskEndDate: DateTime.parse(doc['end_date']),
                ))
            .toList());
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

 Future<void> deleteTask(String id) async {
    await firestore.collection('tasks').doc(id).delete();
    tasks.removeWhere((task) => task.taskId == id);
    notifyListeners();
  }

}
