import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Ball(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.email),
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue[900],
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  Ball({Key key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          leading: Icon(Icons.email),
          title: Text('Ask Me Anything !'),
        ),
        body: Center(
          child: FlatButton(
            child: Image.asset('images/ball1.png'),
            onPressed: () {
              print("Pressed yay !");
            },
          ),
        ),
      ),
    );
  }
}
