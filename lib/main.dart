import 'package:flutter/material.dart';

void main() {
  runApp(CardApp());
}

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                height: double.infinity,
                width: 100.0
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                      color: Colors.yellow,
                      height: 100.0,
                      width: 100.0
                      ),
                      Container(
                      color: Colors.lightGreen,
                      height: 100.0,
                      width: 100.0
                      )
                    ]
                  ),
                Container(
                color: Colors.blue,
                height: double.infinity,
                width: 100.0
                )
            ],
          )
        ),
      ),
    );
  }
}
