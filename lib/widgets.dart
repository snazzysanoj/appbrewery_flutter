import 'package:flutter/material.dart';

enum logoSize { small, large }

class LoginRegisterButtons extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  const LoginRegisterButtons({this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}

class InputTextBox extends StatelessWidget {
  final String text;
  final Function onChanged;

  InputTextBox({this.text, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: text,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}

class LogoProvider extends StatelessWidget {
  final logoSize size;

  LogoProvider({@required this.size});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Container(
        height: size == logoSize.large ? 200.0 : 60.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
