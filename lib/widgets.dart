import 'package:flutter/material.dart';

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
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
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
