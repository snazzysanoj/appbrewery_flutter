import 'package:flutter/material.dart';

const defaultCardColor = Color(0xFF1D1E33);
const bottomCardColor = Colors.red;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(color: defaultCardColor),
                ),
                Expanded(
                  child: CardWidget(color: defaultCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(color: defaultCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(color: defaultCardColor),
                ),
                Expanded(
                  child: CardWidget(color: defaultCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: bottomCardColor,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color color;

  CardWidget({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
