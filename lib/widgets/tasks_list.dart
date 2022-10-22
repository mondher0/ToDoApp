import 'package:flutter/material.dart';
import 'package:shop/widgets/task_tile.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        if (taskdata.task.isEmpty) {
          return Container(
            child: Center(
              child: Text(
                'No task added yet! Add now',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            width: double.infinity,
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                taskTitle: taskdata.task[index].name!,
                isChecked: taskdata.task[index].isDone!,
                checkBoxChange: (newValue) {
                  taskdata.updateTask(taskdata.task[index]);
                },
                removeTask: () {
                  taskdata.removeTask(taskdata.task[index]);
                },
              );
            },
            itemCount: taskdata.task.length,
          );
        }
      },
    );
  }
}
