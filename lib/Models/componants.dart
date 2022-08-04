import 'dart:io';

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
    var temp = Provider.of<TaskProvider>(context);
    tasks = temp.GetTasks;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        checkval = tasks[index]["checked"];
        return ListTile(
          selectedColor: Colors.red,
          focusColor: Colors.blue,
          onLongPress: (){

               temp.DelTask(index);
          },
            title: Text(tasks[index]["text"],
                style: TextStyle(
                    decoration: checkval! ? TextDecoration.lineThrough : null)),
            trailing: Checkbox(
                value: checkval,
              
                onChanged: (bool? value) {
                  print(index);
                  setState(() {
                    tasks[index]["checked"] = value!;
                  });

               
                }));
      },
    );
  }
}
