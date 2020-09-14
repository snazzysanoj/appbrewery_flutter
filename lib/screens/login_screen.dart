import 'package:flutter/material.dart';
import 'package:flash_chat/widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LogoProvider(size: logoSize.large),
            SizedBox(
              height: 48.0,
            ),
            InputTextBox(
              text: 'Enter your email',
              onChanged: (value) {},
            ),
            SizedBox(
              height: 8.0,
            ),
            InputTextBox(
              text: 'Enter your password.',
              onChanged: (value) {},
            ),
            SizedBox(
              height: 24.0,
            ),
            LoginRegisterButtons(
              text: 'Log In',
              onPressed: () {
                print("login?");
              },
            ),
          ],
        ),
      ),
    );
  }
}
