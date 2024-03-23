import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

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
