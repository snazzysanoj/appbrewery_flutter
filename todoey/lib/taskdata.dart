import 'package:flutter/foundation.dart';


class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggle() {
    isDone = !isDone;
  }
}

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Something', isDone: true),
    Task(name: 'Somestuff', isDone: false),
    Task(name: 'abcd', isDone: true),
  ];


}
