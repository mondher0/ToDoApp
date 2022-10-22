import 'package:flutter/material.dart';
import 'package:shop/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import '../widgets/add_tasks.dart';
import '../models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTasks((newTaskTitle) {
                        // setState(() {
                        //   task.add(Task(name: newTaskTitle));
                        //   Navigator.pop(context);
                        // });
                      }),
                    ),
                  ));
        },
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Icon(
                Icons.playlist_add_check,
                color: Colors.white,
                size: 40,
              ),
              Text(
                'ToDayDo',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
         
          SizedBox(
            height: 20,
          ),
          Text(
            '${Provider.of<TaskData>(context).task.length}Tasks',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              child: TasksList(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
