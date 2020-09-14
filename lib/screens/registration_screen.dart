import 'package:flutter/material.dart';
import 'package:flash_chat/widgets.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              text: 'Enter your password',
              onChanged: (value) {},
            ),
            SizedBox(
              height: 24.0,
            ),
            LoginRegisterButtons(
              text: 'Log In',
              onPressed: () {
                print("register?");
              },
            ),
          ],
        ),
      ),
    );
  }
}
