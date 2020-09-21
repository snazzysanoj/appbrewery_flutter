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
                    autofocus: true,
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
