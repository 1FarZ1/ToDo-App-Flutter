import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  static List _tasks = [
    {"text": "buy milk", "checked": false},
    {"text": "buy egg", "checked": false},
    {"text": "buy veg", "checked": false}
  ];
  List get GetTasks =>_tasks;
  void AddTask(text) {
    _tasks.add({"text": text, "checked": false});
    notifyListeners();
  }
}
