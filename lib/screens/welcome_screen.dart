import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Row(
              children: <Widget>[
                LogoProvider(size: logoSize.small),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 200),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            LoginRegisterButtons(
              text: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.route);
              },
              color: Colors.lightBlueAccent,
            ),
            LoginRegisterButtons(
              text: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.route);
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
