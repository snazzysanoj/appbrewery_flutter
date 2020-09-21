import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
    bool showSpinner = false;
    String email, password;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: showSpinner,
      child: Scaffold(
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
                onChanged: (value) => email = value,
              ),
              SizedBox(
                height: 8.0,
              ),
              InputTextBox(
                text: 'Enter your password.',
                onChanged: (value) => password = value,
              ),
              SizedBox(
                height: 24.0,
              ),
              LoginRegisterButtons(
                text: 'Log In',
                onPressed: () async {
                  print("login?");
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final loginUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    setState(() {
                      showSpinner = false;
                    });
                    if (loginUser != null) {
                      Navigator.pushNamed(context, ChatScreen.route);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
