import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/services/provider.dart';

class TaskList extends StatefulWidget {
  TaskList({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool? checkval;

  late List tasks;

  @override
  Widget build(BuildContext context) {
    tasks = Provider.of<TaskProvider>(context).GetTasks;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        checkval = tasks[index]["checked"];
        return ListTile(
            title: Text(tasks[index]["text"],
                style: TextStyle(
                    decoration: checkval! ? TextDecoration.lineThrough : null)),
            trailing: Checkbox(
                value: checkval,
                onChanged: (bool? value) {
              setState(() {
                 tasks[index]["checked"] = value!;
              });
            
                
                }));
      },
    );
  }
}
