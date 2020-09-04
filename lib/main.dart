import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(CardApp());
}

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
            child: Column(
          children: [
            CircleAvatar(
              //backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/pic.jpg'),
              radius: 75.0,
            ),
            Text(
              'Snazzy Sanoj',
              style: TextStyle(
                fontFamily: 'Audiowide',
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: Colors.white,
              ),
            ),
            Text('Developer | Pentester | OSCP',
                style: TextStyle(
                  fontFamily: 'Boogaloo',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.grey[400],
                  letterSpacing: 2,
                )),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                vertical:10.0,
                horizontal:25.0,
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '+91 7639661040',
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 20.0
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                vertical:10.0,
                horizontal:25.0,
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.teal,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'admin@snazzysanoj.in',
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 20.0
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
