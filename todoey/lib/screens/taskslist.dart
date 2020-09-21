import 'package:flutter/material.dart';
import 'AddTask.dart';
import 'package:todoey/taskdata.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  static const String route = "taskslist";

  TasksList({Key key}) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  void addTask(String taskname) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskPopup(
                onAddNewTask: (taskname) => setState(
                  () {
                    Provider.of<TaskData>(context, listen: false)
                        .tasks
                        .add(Task(name: taskname, isDone: false));
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            isScrollControlled: true,
          ),
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60, left: 40, bottom: 40, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.list,
                          color: Colors.lightBlue,
                          size: 30,
                        ),
                        radius: 30,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${Provider.of<TaskData>(context).tasks.length} Tasks',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Tasks(Provider.of<TaskData>(context).tasks),
                    ),
                  ),
                ),
              ]),
        ));
  }
}

class Tasks extends StatefulWidget {
  final List<Task> tasks;
  const Tasks(this.tasks);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          text: widget.tasks[index].name,
          value: widget.tasks[index].isDone,
          onChanged: (v) => setState(
            () => widget.tasks[index].toggle(),
          ),
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({this.text, this.value, this.onChanged});

  final String text;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          decoration: value ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
