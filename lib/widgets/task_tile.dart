import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkBoxChange;
  final void Function() removeTask;
  TaskTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkBoxChange,
      required this.removeTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        onChanged: checkBoxChange,
        value: isChecked,
        activeColor: Colors.teal[400],
      ),
      onLongPress: removeTask,
    );
  }
}
