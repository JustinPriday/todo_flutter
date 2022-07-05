import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Task 1'),
    Task(name: 'Task 2'),
    Task(name: 'Task 3'),
    Task(name: 'Task 4'),
  ];

  void addTask(String task) {
    tasks.add(Task(name: task));
    notifyListeners();
  }

  void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      notifyListeners();
    }
  }

  int completeTasks() {
    int completeCount = 0;
    for (var task in tasks) {
      if (task.isDone) {
        completeCount++;
      }
    }
    return completeCount;
  }

  void toggleDone(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].toggleDone();
      notifyListeners();
    }
  }
}
