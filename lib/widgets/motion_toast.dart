import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../models/task.dart';

void updateTaskAndDisplaySuccess(BuildContext context, Task task) {
  // Mettre à jour la propriété 'completed' de la tâche à true
  task.completed = true;

  // Afficher un toast de succès
  displaySuccessMotionToast(context, "La tâche a été marquée comme terminée.");
}
void displaySuccessMotionToast(BuildContext context, String message) {
  MotionToast.success(
    title: const Text(
      'Success',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(message),
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: false,
  ).show(context);
}

void displayErrorMotionToast(BuildContext context, String message) {
  MotionToast.error(
    title: const Text(
      'Erreur',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(message),
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: false,
  ).show(context);
}
