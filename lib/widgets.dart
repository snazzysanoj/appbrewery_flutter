import 'package:flutter/material.dart';
import 'const.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function onPress;

  IconWidget({this.icon, this.text, this.color, this.onPress});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      onPress: onPress,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: defaultTextStyle,
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;

  CardWidget({this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  CircleButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: onPressed,
      backgroundColor: smallWidgetColor,
      foregroundColor: Colors.white,
      child: Icon(icon),
    );
  }
}

class BottomButton extends StatelessWidget {

final String text;
final Function onPressed;

BottomButton({@required this.text,@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: bottomCardColor,
        width: double.infinity,
        child: Center(
          child: FlatButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
