import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<TaskItem> todayTasks = [];
  List<TaskItem> tomorrowTasks = [];
  List<TaskItem> upcomingTasks = [];
  List<TaskItem> somedayTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "ALL TASKS",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 80),
                _buildTaskSection("Today", todayTasks),
                _buildTaskSection("Tomorrow", tomorrowTasks),
                _buildTaskSection("Upcoming", upcomingTasks),
                _buildTaskSection("Someday", somedayTasks),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskSection(String title, List<TaskItem> tasks) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 30),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 200),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _showAddTaskDialog(title);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: tasks.map((task) => _buildTaskRow(task)).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTaskRow(TaskItem task) {
    return Row(
      children: [
        SizedBox(width: 30),
        Checkbox(
          value: task.isCompleted,
          onChanged: (bool? value) {
            setState(() {
              task.isCompleted = value ?? false;
            });
          },
        ),
        Text(task.taskName),
      ],
    );
  }

  Future<void> _showAddTaskDialog(String sectionTitle) async {
    TextEditingController taskController = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Enter your task'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  switch (sectionTitle) {
                    case 'Today':
                      todayTasks.add(TaskItem(
                        taskName: taskController.text,
                        isCompleted: false,
                      ));
                      break;
                    case 'Tomorrow':
                      tomorrowTasks.add(TaskItem(
                        taskName: taskController.text,
                        isCompleted: false,
                      ));
                      break;
                    case 'Upcoming':
                      upcomingTasks.add(TaskItem(
                        taskName: taskController.text,
                        isCompleted: false,
                      ));
                      break;
                    case 'Someday':
                      somedayTasks.add(TaskItem(
                        taskName: taskController.text,
                        isCompleted: false,
                      ));
                      break;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ), 
          ],
        );
      },
    );
  }
}

class TaskItem {
  final String taskName;
  bool isCompleted;

  TaskItem({required this.taskName, required this.isCompleted});
}

void main() {
  runApp(MaterialApp(
    home: Task(),
  ));
}
