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
              mainAxisAlignment: MainAxisAlignment.center,
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
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            Text('Developer | Pentester | OSCP',
                style: TextStyle(
                  fontFamily: 'Boogaloo',
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                  color: Colors.grey[400],
                  letterSpacing: 2,
                )),
            SizedBox(
              height: 20.0,
              width: 300.0,
              child: Divider(
                thickness: 2.0,
                color: Colors.blueGrey[400]
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical:10.0,
                horizontal:25.0,
              ),
              child: ListTile(
                title: Text(
                  ' +91 7639661040',
                  style: TextStyle(
                    fontSize: 18,
                  )
                ),
                leading: Icon(
                  Icons.phone,
                  color: Colors.blue
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical:10.0,
                horizontal:25.0,
              ),
              child: ListTile(
                title: Text(
                  'admin@snazzysanoj.in',
                  style: TextStyle(
                    fontSize: 18.0
                  ),
                ),
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
          ],
        )),
      ),
    );
  }
}
