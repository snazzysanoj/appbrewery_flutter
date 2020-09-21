import 'package:flutter/material.dart';
import 'screens/taskslist.dart';
import 'package:provider/provider.dart';
import 'taskdata.dart';

void main() {
  runApp(Todoey());
}

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (_) => TaskData(),
      child: MaterialApp(
        initialRoute: TasksList.route,
        routes: {TasksList.route: (context) => TasksList()},
      ),
    );
  }
}
