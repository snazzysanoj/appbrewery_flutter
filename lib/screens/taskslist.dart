import 'package:flutter/material.dart';

class AddTaskPopup extends StatelessWidget {
  const AddTaskPopup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Add Task',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 30,
                          // fontWeight: FontWeight.bold,
                        )),
                  ),
                  Divider(thickness: 3, color: Colors.lightBlueAccent),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Task Name',
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              FlatButton(
                padding: EdgeInsets.all(20),
                color: Colors.lightBlueAccent,
                onPressed: () {},
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class TasksList extends StatelessWidget {
  static const String route = "taskslist";

  const TasksList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
              context: context, builder: (context) => AddTaskPopup()),
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
                        '12 Tasks',
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
                    child: Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Tasks(),
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}

List tasks = [
  {'title': 'Something', 'value': true},
  {'title': 'Somestuff', 'value': false},
  {'title': 'abcd', 'value': true},
];

class Tasks extends StatelessWidget {
  const Tasks({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(
          'Something',
          true,
          null,
        ),
        TaskTile(
          'Something 2',
          false,
          null,
        ),
      ],
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile(this.text, this.value, this.onChanged);

  final String text;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: Checkbox(
        value: value,
        onChanged: (v) => onChanged(v),
      ),
    );
  }
}
