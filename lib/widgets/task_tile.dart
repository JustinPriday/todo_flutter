import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final int index;

  TaskTile({
    Key? key,
    required this.index,
    required this.taskTitle,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      onLongPress: () {
        context.read<TaskData>().deleteTask(index);
      },
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue) {
          context.read<TaskData>().toggleDone(index);
        },
      ),
    );
  }
}
