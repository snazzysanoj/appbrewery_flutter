import 'package:flutter/material.dart';
import 'screens/taskslist.dart';

void main() {
  runApp(Todoey());
}

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TasksList.route,
      routes: {
        TasksList.route: (context) => TasksList()
      },
    );
  }
}