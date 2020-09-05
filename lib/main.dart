import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
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
