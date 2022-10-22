import 'dart:ffi';

import 'package:flutter/material.dart';
import './task.dart';

class TaskData extends ChangeNotifier {
  List<Task> task = [];
  Void ?addTask(String? newTaskTitle) {
    task.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  Void? updateTask(Task task) {
    task.doneChanged();
    notifyListeners();
  }

  void removeTask(Task delete) {
    task.remove(delete);
    notifyListeners();
  }
}
